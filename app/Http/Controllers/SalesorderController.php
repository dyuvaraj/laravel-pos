<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Salesorder;
use App\Models\Orderlist;

use App\Http\Controllers\Controller;
use Validator;
use DB;

class SalesorderController extends Controller
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
            'order_date' => 'required',
            'customer_name' => 'required',
            'products' => 'required',
            'total' => 'required'
        ]);

        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        $so = new Salesorder();
        $so->order_date = date('Y-m-d', strtotime($request->order_date));
        $so->customer_name = $request->customer_name;
        $so->total = $request->total;
        $so->save();

        $so_id = $so->id;

        $products = json_decode($request->products);

        foreach($products as $product){
            $ol = new Orderlist();
            $ol->salesorder_id = $so_id;
            $ol->product_id = $product->product_id;
            $ol->quantity = $product->quantity;
            $ol->save();
        }        

        return response()->json([
            'message' => 'Order Created successfully'
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
        $so = Salesorder::find($id);
        $ol = Orderlist::where('salesorder_id', $id)->get();

        if($so){
            return response()->json([
                'salesorder' => $so,
                'orderlist' => $ol
            ], 200);
        }
        else{
            return response()->json([
                'message' => 'Sales order not found'
            ], 200);
        }
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
        $so = Salesorder::find($id);
        $so->order_date = date('Y-m-d', strtotime($request->order_date));
        $so->customer_name = $request->customer_name;
        $so->total = $request->total;
        $so->save();

        $products = json_decode($request->products);

        foreach($products as $product){
            $ol = Orderlist::find($product->orderlist_id);
            $ol->product_id = $product->product_id;
            $ol->quantity = $product->quantity;
            $ol->save();
        }

        return response()->json([
            'message' => 'Sales order updated successfully'
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
        //
    }

    /**
     * Get total no of sales order
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getTotalSalesOrder()
    {
        $so = Salesorder::all();
        $TotalSaleofProducts = DB::select('SELECT b.product_id, product_name, (product_sell_price*b.total_sale - product_cost*b.total_sale) as Profit, b.total_sale from products as a
        LEFT JOIN(
        SELECT product_id, sum(quantity) total_sale FROM `orderlists` GROUP BY product_id ) as b ON a.id = b.product_id');

        $TotalProfit = DB::select('SELECT SUM(product_sell_price*b.total_sale - product_cost*b.total_sale) as Profit from products as a
        LEFT JOIN(
        SELECT product_id, sum(quantity) total_sale FROM `orderlists` GROUP BY product_id ) as b ON a.id = b.product_id ');

        return response()->json([
            'total_sales_order' => count($so),
            'total_product_sold' => $TotalSaleofProducts,
            'total_profit' => $TotalProfit
        ], 200);  
    }


    public function getTotalSalesOrderFilter()
    {

        $so = Salesorder::all();

        $TotalSaleofProducts = DB::select('SELECT  b.product_id, c. product_name, (sum(b.quantity)*product_sell_price - sum(b.quantity)*product_cost) as profit_sale FROM salesorders as a
        JOIN(SELECT salesorder_id, product_id, quantity from orderlists) as b 
        JOIN(SELECT id, product_name, product_cost, product_sell_price from products  ) as c  
        on b.product_id = c.id AND a.id=b.salesorder_id WHERE (a.order_date BETWEEN "2021-02-16" AND "2021-03-16") GROUP BY b.product_id;');

        $TotalProfit = 0;
        foreach($TotalSaleofProducts as $TotalSaleofProduct){
            $TotalProfit = $TotalSaleofProduct->profit_sale + $TotalProfit;
        }

        $TotalSale = DB::select('SELECT * FROM salesorders WHERE (order_date BETWEEN "2021-02-16" AND "2021-03-16");');

        return response()->json([
            'total_sales_order' => count($TotalSale),
            'total_product_sold_bw_dates' => $TotalSaleofProducts,
            'total_no_sales_bw_dates' => $TotalSale,
            'total_profit_bw_dates' => $TotalProfit
        ], 200);  
    }
}
