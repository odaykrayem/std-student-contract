<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * Class User
 *
 * @property int $id
 * @property string|null $name
 * @property string|null $email
 * @property string|null $password
 * @property int $type
 *
 * @package App\Models
 */
class Student extends Authenticatable
{
    protected $table = 'students';
    public $timestamps = false;

    protected $casts = [
        'type' => 'int'
    ];

    protected $hidden = [
        'password'
    ];

    protected $fillable = [
        'name',
        'email',
        'status',
        'password',
        'type'
    ];

    protected $appends = ['user'];

    public function getUserAttribute()
    {
        $data = $this->belongsTo(Student::class, 'student_id')->first();

        if ($data) {
            return $data;
        }

        return [];
    }
}
