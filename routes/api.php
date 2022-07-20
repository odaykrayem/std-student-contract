<?php

use App\Models\Report;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Validator;


/**
 *  Users types :
 *  Student = 0
 *  honor_student = 1
 *  professor = 2
 */
/**
 * Community Questions and professors list are related to department
 */
/**
 * register_student
 * @param String name
 * @param String email /validation/ verification
 * @param String password /validation
 *
 * @return Student
 */


Route::post('/register-student', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'name' => 'required',
        'email' => 'required|unique:students,email',
        'password' => 'required',
        'type' => 'required|numeric'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }


    $data = new \App\Models\Student();
    $data->name = $request->input('name');
    $data->email = $request->input('email');
    $data->type = $request->input('type');
    $data->password = bcrypt($request->password);
    $data->status = rand(111111, 999999);
    $data->save();

    try {
        $email = $data->email;
        Mail::send('code', [
            'code' => $data->status
        ], function ($message) use ($email) {
            $message->to($email, 'Code')->subject
            ('Code');
            $message->from('std@scit.co', 'Code');
        });


//        $msg = "Your Code is : " . $data->status;
//        $msg = wordwrap($msg, 70);
//        mail($email, "My Code", $msg);

    } catch (\Exception $ex) {
        \Log::info($ex->getMessage());
    }

    return Response::json([
        'message' => 'User Saved!',
        'data' => $data
    ], 200);

});

/**
 * register_professor
 * @param String name
 * @param String email /validation / verification /
 * @param password /validation /
 * @param int department_id
 * @param String specialization
 * @return professor
 */


Route::post('/register-professor', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'name' => 'required',
        'email' => 'required|unique:professors,email',
        'password' => 'required',
        'specialization' => 'required',
        'department_id' => 'required|numeric'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = new \App\Models\Professor();
    $data->name = $request->input('name');
    $data->email = $request->input('email');
    $data->specialization = $request->input('specialization');
    $data->department_id = $request->input('department_id');
    $data->start_free_time = $request->input('start_free_time');
    $data->end_free_time = $request->input('end_free_time');
    $data->password = bcrypt($request->password);
    $data->status = rand(111111, 999999);
    $data->save();

    try {
        $email = $data->email;
        Mail::send('code', [
            'code' => $data->status
        ], function ($message) use ($email) {
            $message->to($email, 'Code')->subject
            ('Code');
            $message->from('std@scit.co', 'Code');
        });

//        $msg = "Your Code is : " . $data->status;
//        $msg = wordwrap($msg, 70);
//        mail($email, "My Code", $msg);

    } catch (\Exception $ex) {
        \Log::info($ex->getMessage());
    }


    return Response::json([
        'message' => 'User Saved!',
        'data' => $data
    ], 200);

});


/**
 * login
 * @param String email
 * @param String password
 *
 * @return Student + type / or / professor
 */

Route::post('/login', function (Request $request) {
    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'email' => 'required',
        'password' => 'required|min:8'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    if (auth('student')->attempt(['email' => $input['email'],
        'password' => $input['password']], false)) {


        $user = \App\Models\Student::where([
            'email' => $input['email']
        ])->first();

        if ($user->status != 1) {

            return Response::json([
                'message' => 'User Not Verified!',
                'data' => $user
            ], 200);
        }

        return Response::json([
            'message' => 'User founded!',
            'data' => $user
        ], 200);
    }
    if (auth('professors')->attempt(['email' => $input['email'],
        'password' => $input['password']], false)) {


        $user = \App\Models\Professor::where([
            'email' => $input['email']
        ])->first();


        if ($user->status != 1) {

            return Response::json([
                'message' => 'User Not Verified!',
                'data' => $user
            ], 200);
        }


        $user->type = 2;

        return Response::json([
            'message' => 'User founded!',
            'data' => $user
        ], 200);
    } else {
        return Response::json([
            'message' => 'User not found!',
            'data' => ''
        ], 200);
    }


});

/**
 * edit_password_student
 * @param int student_id
 * @param String password /validation
 *
 * @return student / or / just status of api request
 */


Route::post('/edit_password_student', function (Request $request) {
    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'student_id' => 'required',
        'password' => 'required|min:8'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $user = \App\Models\Student::where([
        'id' => $input['student_id']
    ])->first();

    $user->password = bcrypt($input['password']);
    $user->update();

    return Response::json([
        'message' => 'User founded!',
        'data' => $user
    ], 200);


});


/**
 * edit_password_professor
 * @param int professor_id
 * @param String password /validation
 *
 * @return  professor  / or / just status of api request
 */


Route::post('/edit_password_professor', function (Request $request) {
    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'professor_id' => 'required',
        'password' => 'required|min:8'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $user = \App\Models\Professor::where([
        'id' => $input['professor_id']
    ])->first();

    $user->password = bcrypt($input['password']);
    $user->update();

    return Response::json([
        'message' => 'User founded!',
        'data' => $user
    ], 200);


});


/**
 * get_books
 *
 * @return list of book form books table
 * every object has these values
 * -int id
 * -String title
 * -String url
 */


Route::get('/get_books', function (Request $request) {

    $data = \App\Models\Book::get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});

/**
 * get_departments
 *
 * @return list of departments from departments table
 * every object has these values :
 * -int id
 * -String name
 */

Route::get('/get_departments', function (Request $request) {

    $data = \App\Models\Department::get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});


/**
 * get_community_questions
 *
 * @param int department_id
 *
 * @return list of community questions
 * every object has these values
 * -int id
 * -String student_name; from student table using his id
 * -String question;
 * -String created_at;
 * -boolean is_common; //  for now question become common if his answers are more than 5
 */


Route::get('/get_community_questions', function (Request $request) {

    $data = \App\Models\CommunityQuestion::query();

    if ($request->has('department_id')) {
        $data = $data->where('department_id', $request->get('department_id'));
    }

    if ($request->has('student_id')) {
        $data = $data->where('student_id', $request->get('student_id'));
    }

    $data = $data->get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});

/**
 * post_community_question
 *
 * @param int student_id
 * @param String question
 * @param int department_id
 *
 * @return status of api request
 */

Route::post('/post_community_question', function (Request $request) {

    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'student_id' => 'required',
        'question' => 'required',
        'department_id' => 'required',
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = new \App\Models\CommunityQuestion();
    $data->student_id = $input['student_id'];
    $data->department_id = $input['department_id'];
    $data->question = $input['question'];
    $data->is_common = $request->is_common ? $request->is_common : 1;
    $data->save();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});


/**
 * get_community_question_replies
 *
 * @param int question_id
 *
 * @return list of replies for this question
 * every object has these values
 * - int id;
 * - String studentName; // who post this reply
 * - String reply;
 *-  String created_at;
 */


Route::get('/get_community_question_replies', function (Request $request) {


    $data = \App\Models\CommunityReply::where('question_id', $request->question_id)->get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});


/**
 * post_community_reply
 *
 * @param int student_id
 * @param int question_id
 * @param String reply
 *
 * @return status of api request
 */


Route::post('/post_community_reply', function (Request $request) {

    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'student_id' => 'required',
        'question_id' => 'required',
        'reply' => 'required',
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = new \App\Models\CommunityReply();
    $data->student_id = $input['student_id'];
    $data->question_id = $input['question_id'];
    $data->reply = $input['reply'];
    $data->save();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});


/**
 * get_professors
 *
 * @param int department_id
 *
 * @return list of professors
 * every object has these values
 * -int id
 * -String name
 * -String email
 * -String password
 * -String department_name //foreign key
 * -String specialization
 * -String start_free_time
 * -String end_free_time
 */

Route::get('/get_professors', function (Request $request) {


    $data = \App\Models\Professor::where('department_id', $request->department_id)->get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});

/**
 * ask_professor
 *
 * @param int student_id
 * @param int professor_id
 * @param String title
 * @param String content
 *
 * @return status of api request
 */


Route::post('/ask_professor', function (Request $request) {

    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'student_id' => 'required',
        'professor_id' => 'required',
        'title' => 'required',
        'content' => 'required',
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = new \App\Models\ProfessorQuestion();
    $data->user_id = $input['student_id'];
    $data->professor_id = $input['professor_id'];
    $data->title = $input['title'];
    $data->content = $input['content'];
    $data->save();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});

/**
 * get_my_questions_to_professor //questions to  professor by this student
 *
 * @param int student_id
 * @param int professor_id
 *
 * @return list of professor questions
 * each object has these values:
 * -int id
 * String title
 * String content
 * String answer
 * date created_at
 */


Route::get('/get_my_questions_to_professor', function (Request $request) {


    $data = \App\Models\ProfessorQuestion::
    where('user_id', $request->student_id)->
    where('professor_id', $request->professor_id)->
    get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});


/**
 * get_honor_students
 *
 * @return list of student which there type is honor mean = 1
 * each object has these values:
 * - int id
 * - String name
 * - string email
 */


Route::get('/get_honor_students', function (Request $request) {


    $data = \App\Models\Student::where('type', 1)->get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});


/**
 * ask_honor
 *
 * @param int student_id
 * @param int honor_id
 * @param String title
 * @param String content
 *
 * @return status of api request
 */


Route::post('/ask_honor', function (Request $request) {

    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'student_id' => 'required',
        'honor_id' => 'required',
        'title' => 'required',
        'content' => 'required',
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = new \App\Models\HonorsQuestion();
    $data->user_id = $input['student_id'];
    $data->honor_id = $input['honor_id'];
    $data->title = $input['title'];
    $data->content = $input['content'];
    $data->save();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});


/**
 * get_my_questions_to_honor // questions to honor by this student
 *
 * @param int student_id
 * @param int honor_id
 *
 * @return list of honor questions
 * each object has these values:
 * -int id
 * -String title
 * -String content
 * -String answer
 * -date created_at
 */


Route::get('/get_my_questions_to_honor', function (Request $request) {


    $data = \App\Models\HonorsQuestion::
    where('user_id', $request->student_id)->
    where('honor_id', $request->honor_id)->
    get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});

/**
 * get_honor_questions // questions "to" this honor
 *
 * @param honor_id
 *
 * @return list of honor questions
 * each object has these values:
 * -int id
 * -String student_name //who asked the question
 * -String title
 * -String content
 * -String answer
 * -date created_at
 */

Route::get('/get_honor_questions', function (Request $request) {


    $data = \App\Models\HonorsQuestion::
    where('honor_id', $request->honor_id)->
    get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});
/**
 * answer_honor_question
 *
 * @param int honor_id
 * @param int question_id
 * @param String answer
 *
 * @return status of api request
 */


Route::post('/answer_honor_question', function (Request $request) {

    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'question_id' => 'required',
        'honor_id' => 'required',
        'answer' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = \App\Models\HonorsQuestion::where([
        'id' => $input['question_id'],
        'honor_id' => $input['honor_id']
    ])->update([
        'answer' => $input['answer']
    ]);

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);

});


/**
 * get_professor_questions // questions to this professor
 *
 * @param professor_id
 *
 * @return list of professor questions
 * each object has these values:
 * -int id
 * -String student_name //who asked the question
 * -String title
 * -String content
 * -String answer
 * -date created_at
 */

Route::get('/get_professor_questions', function (Request $request) {


    $data = \App\Models\ProfessorQuestion::
    where('professor_id', $request->professor_id)->
    get();

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);


});


/**
 * answer_professor_question
 *
 * @param int professor_id
 * @param int question_id
 * @param String answer
 *
 * @return status of api request
 */

Route::post('/answer_professor_question', function (Request $request) {

    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'question_id' => 'required',
        'professor_id' => 'required',
        'answer' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = \App\Models\ProfessorQuestion::where([
        'id' => $input['question_id'],
        'professor_id' => $input['professor_id']
    ])->update([
        'answer' => $input['answer']
    ]);

    return Response::json([
        'message' => 'founded!',
        'data' => $data
    ], 200);

});

/**
 *update_professor_schedule
 *
 * @param int professor_id
 * @param String start_free_time
 * @param String end_free_time
 *
 * @return status of api request
 */


Route::post('/update_professor_schedule', function (Request $request) {

    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'professor_id' => 'required',
        'start_free_time' => 'required',
        'end_free_time' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = \App\Models\Professor::where('id', $input['professor_id'])->first();
    $data->start_free_time = $request->input('start_free_time');
    $data->end_free_time = $request->input('end_free_time');
    $data->update();

    return Response::json([
        'message' => 'User Saved!',
        'data' => $data
    ], 200);

});


Route::post('/verify_user', function (Request $request) {
    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'type' => 'required',
        'code' => 'required',
        'email' => 'required'
    ]);


    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    if ((int)$input['type'] == 1) {

        $user = \App\Models\Student::where([
            'email' => $input['email']
        ])->first();


    } else {
        $user = \App\Models\Professor::where([
            'email' => $input['email']
        ])->first();

    }

    if (is_null($user) || $user->status . '' != $input['code']) {
        return Response::json([
            'message' => 'Code not Correct!',
            'data' => $user
        ], 200);
    }


    $user->status = 1;
    $user->update();

    return Response::json([
        'message' => 'User founded!',
        'data' => $user
    ], 200);


});


Route::post('/upload_book', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'title' => 'required',
        'file' => 'required',
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }


    $cv = '';
    $file_param = 'file';
    if ($request->hasFile($file_param)) {
        $file_name = md5(time()) . '.' . $request->file($file_param)->getClientOriginalExtension();
        $request->file($file_param)->move(storage_path('app\public\upload'), $file_name);
        $cv = '[{"download_link":"'.'upload\\\\' . $file_name.'","original_name":"'. $file_name.'"}]';
    }


    $data = new \App\Models\Book();
    $data->title = $request->input('title');
    $data->url = $cv;
    $data->save();

    return Response::json([
        'message' => 'Book Saved!',
        'data' => $data
    ], 200);

});


Route::post('/send_report', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'user_id' => 'required',
        'title' => 'required',
        'content' => 'required',
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = new \App\Models\Report();
    $data->user_id = $request->input('user_id');
    $data->title = $request->input('title');
    $data->content = $request->input('content');
    $data->save();

    return Response::json([
        'message' => 'Report Saved!',
        'data' => $data
    ], 200);

});

Route::post('/get_report', function (Request $request) {


    $data = Report::query();

    if ($request->has('user_id')) {
        $data = $data->where('user_id', $request->user_id);
    }

    $data = $data->get();

    return Response::json([
        'message' => 'Reports!',
        'data' => $data
    ], 200);

});