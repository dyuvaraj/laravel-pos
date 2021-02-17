<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Product;

use App\Http\Controllers\Controller;
use Validator;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_name' => 'required',
            'product_code' => 'required',
            'product_cost' => 'required',
            'product_sell_price' => 'required'
        ]);

        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        $product = new Product();
        $product->product_name = $request->product_name;
        $product->product_code = $request->product_code;
        $product->product_cost = $request->product_cost;
        $product->product_sell_price = $request->product_sell_price;
        $product->save();

        return response()->json([
            'message' => 'Product successfully added'
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::find($id);

        if($product){
            return response()->json([
                'product' => $product
            ], 200);
        }
        else{
            return response()->json([
                'message' => 'Product not found'
            ], 200);
        }
    }

    /**
     * Display the all resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function showAll()
    {
        $product = Product::all();

        return response()->json([
                'product' => $product
        ], 200);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $product = Product::find($id);
        $product->product_name = $request->product_name;
        $product->product_code = $request->product_code;
        $product->product_cost = $request->product_cost;
        $product->product_sell_price = $request->product_sell_price;
        $product->save();

        return response()->json([
            'message' => 'Product updated successfully'
        ], 200);   
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        $product->delete();

        return response()->json([
            'message' => 'Product deleted successfully'
        ], 200);  
    }
}
