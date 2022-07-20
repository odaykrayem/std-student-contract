<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ProfessorQuestion
 *
 * @property int $id
 * @property int|null $user_id
 * @property int|null $professor_id
 * @property string|null $title
 * @property string|null $content
 * @property string|null $answer
 * @property Carbon $created_at
 *
 * @package App\Models
 */
class ProfessorQuestion extends Model
{
    protected $table = 'professor_questions';
    public $timestamps = false;

    protected $casts = [
        'user_id' => 'int',
        'professor_id' => 'int'
    ];

    protected $fillable = [
        'user_id',
        'professor_id',
        'title',
        'content',
        'answer'
    ];


    protected $appends = ['student', 'professor'];

    public function getStudentAttribute()
    {
        $data = $this->belongsTo(Student::class, 'student_id')->first();
        if ($data) {
            return $data;
        }
        return [];
    }

    public function getProfessorAttribute()
    {
        $data = $this->belongsTo(Professor::class, 'professor_id')->first();
        if ($data) {
            return $data;
        }
        return [];
    }
}
