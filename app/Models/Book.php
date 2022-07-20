<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Book
 * 
 * @property int $id
 * @property string $title
 * @property string $url
 *
 * @package App\Models
 */
class Book extends Model
{
	protected $table = 'books';
	public $timestamps = false;

	protected $fillable = [
		'title',
		'url'
	];


    protected $appends = ['cv_url'];

    function getCvUrlAttribute(){
        $url = json_decode($this->url);
        if(is_array($url) && sizeof($url)>0){
            $url = 'storage\\'.$url[0]->download_link;
            return $url;
        }else{
            return $this->url;
        }

    }
}
