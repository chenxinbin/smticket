<?php
/**
 * Author: walala_numst@163.com
 * Date: 2017/12/14 0014
 * Time: 19:54
 */
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Zizaco\Entrust\Traits\EntrustUserTrait;

class User extends  Model{
    use EntrustUserTrait;

    protected $table='users';

}