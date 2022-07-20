<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CommunityQuestion
 *
 * @property int $id
 * @property int|null $student_id
 * @property string|null $question
 * @property int|null $department_id
 * @property Carbon|null $created_at
 * @property int|null $is_common
 *
 * @package App\Models
 */
class CommunityQuestion extends Model
{
    protected $table = 'community_questions';
    public $timestamps = false;

    protected $casts = [
        'student_id' => 'int',
        'department_id' => 'int',
        'is_common' => 'int'
    ];

    protected $fillable = [
        'student_id',
        'question',
        'department_id',
        'is_common'
    ];


    protected $appends = ['student', 'department', 'is_common_now'];

    public function getStudentAttribute()
    {
        $data= $this->belongsTo(Student::class, 'student_id')->first();

        if ($data) {
            return $data;
        }
        return [];
    }

    public function getDepartmentAttribute()
    {
        $data= $this->belongsTo(Department::class, 'department_id')->first();
        if ($data) {
            return $data;
        }
        return [];
    }


    public function getIsCommonNowAttribute()
    {
        $count = CommunityReply::where('question_id', $this->id)->count();
        if ($count > 3) {
            return 1;
        } else {
            $this->is_common;
        }
    }
}
