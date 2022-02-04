<?php

use Illuminate\Support\Facades\Route;

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
    return view('auth.login');
});
// Route::get('/registro', function () {
//     return view('auth.register');
// });
Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');


Route::group(['middleware' => ['auth:web'], 'verified'], function () {
    Route::get('/logout', 'Modulos\Administracion\tipo_desechos@Salir');
});

 
Route::get('/test', function() {
    return view('auth.register');
 });


 //Route::get('/{any}', function() { return view('your-main-view'); })->where('any', '(.*)');
//  $prefijo = config('global.router_prefix');
//  //$prefijo ="";
//   Route::get($prefijo . '/{any}', 'AppController@index')->where('any', '.*');
//   Route::get($prefijo, 'AppController@index')->where('any', '.*');