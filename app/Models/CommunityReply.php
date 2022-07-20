<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CommunityReply
 *
 * @property int $id
 * @property int|null $student_id
 * @property int|null $question_id
 * @property string|null $reply
 * @property Carbon|null $created_at
 *
 * @package App\Models
 */
class CommunityReply extends Model
{
    protected $table = 'community_replies';
    public $timestamps = false;

    protected $casts = [
        'student_id' => 'int',
        'question_id' => 'int'
    ];

    protected $fillable = [
        'student_id',
        'question_id',
        'reply'
    ];


    protected $appends = ['student', 'question'];

    public function getStudentAttribute()
    {
        $data = $this->belongsTo(Student::class, 'student_id')->first();
        if ($data) {
            return $data;
        }
        return [];
    }

    public function getQuestionAttribute()
    {
        $data = $this->belongsTo(CommunityQuestion::class, 'question_id')->first();
        if ($data) {
            return $data;
        }
        return [];
    }
}
