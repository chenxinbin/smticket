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

    Route::any('ticket/create', 'TicketController@create')->name('ticket.create');
    Route::any('ticket/list', 'TicketController@list')->name('ticket.list');
    Route::any('ticket/undo', 'TicketController@undo')->name('ticket.undo');
    Route::any('ticket/{ticket_id}', 'TicketController@show')->name('ticket.show');

    Route::any('user/profile', 'UserController@profile')->name('user.profile');


});