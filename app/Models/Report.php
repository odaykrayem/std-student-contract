<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;


class Report extends Authenticatable
{
    protected $table = 'reports';
    public $timestamps = false;

}
