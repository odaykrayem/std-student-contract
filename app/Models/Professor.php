<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * Class Professor
 * 
 * @property int $id
 * @property string|null $name
 * @property string|null $email
 * @property string|null $password
 * @property int|null $department_id
 * @property string|null $specialization
 * @property string|null $start_free_time
 * @property string|null $end_free_time
 *
 * @package App\Models
 */
class Professor extends Authenticatable
{
	protected $table = 'professors';
	public $timestamps = false;

	protected $casts = [
		'department_id' => 'int'
	];

	protected $hidden = [
		'password'
	];

	protected $fillable = [
		'name',
		'email',
		'password',
        'status',
		'department_id',
		'specialization',
		'start_free_time',
		'end_free_time'
	];
}
