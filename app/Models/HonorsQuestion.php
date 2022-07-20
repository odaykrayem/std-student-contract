<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class HonorsQuestion
 *
 * @property int $id
 * @property int|null $user_id
 * @property int|null $honor_id
 * @property string|null $title
 * @property string|null $content
 * @property int|null $answer
 * @property Carbon $created_at
 *
 * @package App\Models
 */
class HonorsQuestion extends Model
{
    protected $table = 'honors_questions';
    public $timestamps = false;

    protected $casts = [
        'user_id' => 'int',
        'honor_id' => 'int'
    ];

    protected $fillable = [
        'user_id',
        'honor_id',
        'title',
        'content',
        'answer'
    ];


    protected $appends = ['student', 'honor'];

    public function getStudentAttribute()
    {
        $data = $this->belongsTo(Student::class, 'student_id')->first();
        if ($data) {
            return $data;
        }
        return [];
    }

    public function getHonorAttribute()
    {
        $data = $this->belongsTo(Student::class, 'honor_id')->first();
        if ($data) {
            return $data;
        }
        return [];
    }
}
