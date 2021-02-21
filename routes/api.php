<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {
    Route::post('/login', [App\Http\Controllers\AuthController::class, 'login']);
    Route::post('/register', [App\Http\Controllers\AuthController::class, 'register']);
    Route::post('/logout', [App\Http\Controllers\AuthController::class, 'logout']);

    Route::get('/user-profile', [App\Http\Controllers\AuthController::class, 'userProfile']);   

    // Product Route
    Route::post('/product-add', [App\Http\Controllers\ProductController::class, 'store']);
    Route::post('/product-edit/{id}', [App\Http\Controllers\ProductController::class, 'update']);
    Route::get('/product-show/{id}', [App\Http\Controllers\ProductController::class, 'show']);
    Route::get('/product-showall', [App\Http\Controllers\ProductController::class, 'showAll']);
    Route::get('/productById/{id}', [App\Http\Controllers\ProductController::class, 'getProductById']);

    // Sales Order Route
    Route::post('/salesorder-add', [App\Http\Controllers\SalesorderController::class, 'store']);
    Route::post('/salesorder-edit/{id}', [App\Http\Controllers\SalesorderController::class, 'update']);
    Route::get('/salesorder-show/{id}', [App\Http\Controllers\SalesorderController::class, 'show']);
    Route::get('/salesorder-showall', [App\Http\Controllers\SalesorderController::class, 'showAll']);
    Route::get('/salesorder-all', [App\Http\Controllers\SalesorderController::class, 'getTotalSalesOrder']);
    
    // Reports
    Route::get('/salesorder-bwd/{fromdate}/{todate}', [App\Http\Controllers\SalesorderController::class, 'getTotalSalesOrderFilter']);
    Route::get('/salesorder-cus/{customer}', [App\Http\Controllers\SalesorderController::class, 'getTotalSalesOrderByCustomerFilter']);
    Route::get('/overallreport', [App\Http\Controllers\SalesorderController::class, 'getTotalSalesOrder']);
    
    // Customers
    Route::get('/customers', [App\Http\Controllers\SalesorderController::class, 'getCustomers']);

    // VerifyEmail
    Route::get('/verifyemail/{email}', [App\Http\Controllers\AuthController::class, 'verifyemail']);


});