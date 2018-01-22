<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();


Route::group(['prefix' => 'admin', 'middleware' => ['auth', 'menu']], function () {
    Route::get('dashboard', 'HomeController@index')->name('dashboard');

    Route::any('ticket/create', 'UserController@profile')->name('ticket.create');
    Route::any('ticket/list', 'UserController@profile')->name('ticket.list');
    Route::any('ticket/undo', 'UserController@profile')->name('ticket.undo');

    Route::any('user/profile', 'UserController@profile')->name('user.profile');


});