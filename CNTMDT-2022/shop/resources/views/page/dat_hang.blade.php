@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Đặt hàng</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb">
					<a href="{{route('trang-chu')}}">Home</a> / <span>Đặt hàng</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
	<div class="container">
		<div id="content">
			@if (Session::has('thongbao'))
			<div class="alert alert-success">{{Session::get('thongbao')}}</div>
			@endif
			<form action="{{route('dathang')}}" method="post" class="beta-form-checkout">
				<input type="hidden" name="_token" value="{{csrf_token()}}">
				<div class="row">
					<div class="col-sm-6">
						<h4>Thông tin khách hàng</h4>
						<div class="space20">&nbsp;</div>

						<div class="form-block">
							<label for="name">Họ và tên*</label>
							<input type="text" id="name" name="full_name" placeholder="nhập họ tên" required>
						</div>
						<div class="form-block">
							<label for="gender">Giới tính*</label>
							<input type="radio" id="name" name="gender" value="Nam" checked="checked" style="width: 10%" required>
							<span>Nam</span>
							<input type="radio" id="name" name="gender" value="Nữ" required style="width: 10%">
							<span>Nữ</span>
						</div>
						<div class="form-block">
							<label for="address">Địa chỉ*</label>
							<input type="text" id="address" name="address" placeholder="Street Address" required>
							
						</div>

						<div class="form-block">
							<label for="email">Email address*</label>
							<input type="email" id="email" name="email" placeholder="example@gmail.com" required>
						</div>

						<div class="form-block">
							<label for="phone">Điện thoại*</label>
							<input type="text" id="phone" name="phone" required>
						</div>
						
						<div class="form-block">
							<label for="notes">Ghi chú</label>
							<textarea id="notes" name="notes"></textarea>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="your-order">
							<div class="your-order-head"><h5>Đơn hàng của bạn</h5></div>
							<div class="your-order-body">
								<div class="your-order-item">
									<div>
										@if(Session::has('cart'))
										@foreach ($product_cart as $cart)
											<!--  one item	 -->
										<div class="media">
											<img width="35%" src="source/image/product/{{$cart['item']['image']}}" alt="" class="pull-left">
											<div class="media-body">
												<p class="font-large">{{$cart['item']['name']}}</p>
												<span class="color-gray your-order-info"><b style="color: black">Số lượng: {{$cart['qty']}}</b></span>
												<span class="color-gray your-order-info"><b style="color: black">Đơn giá: {{number_format($cart['price']/$cart['qty'])}}</b></span>
												
											</div>
										</div>
									<!-- end one item -->
										@endforeach
									
									@endif
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="your-order-item">
									<div class="pull-left"><p class="your-order-f18" style="color: red"><b>Tổng tiền:</b></p></div>
									<div class="pull-right"><h5 class="color-black" style="color: red">
										@if(Session::has('cart'))
										{{number_format($totalPrice)}}
										@else 0 
										@endif
										đồng</h5></div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="your-order-head"><h5>Hình thức thanh toán</h5></div>
							
							<div class="your-order-body">
								<ul class="payment_methods methods">
									<li class="payment_method_bacs">
										<input id="payment_method_bacs" type="radio" class="input-radio" name="payment_method" value="COD" checked="checked" data-order_button_text="">
										<label for="payment_method_bacs">Thanh toán trực tiếp </label>
										<div class="payment_box payment_method_bacs" style="display: block;">
											Thanh toán khi nhận được hàng
										</div>						
									</li>

									<li class="payment_method_cheque">
										<input id="payment_method_cheque" type="radio" class="input-radio" name="payment_method" value="ATM" data-order_button_text="">
										<label for="payment_method_cheque">Chuyển khoản  </label>
										<div class="payment_box payment_method_cheque" style="display: none; margin: 10px">
											<span style="font-size: 20px; font-style:oblique"> Ngân hàng: MB-Bank</span>
											<p style="font-size: 20px"> số tài khoản: <span style="color: rgb(136, 136, 231)"><b> 6868686878999</b></span></p>
											<p style="font-size: 20px"> Chủ tài khoản:s <span style="color: rgb(238, 9, 9)"><b>Đặng Thế Duy</b></span> </p>
										</div>						
									</li>
									
									<li class="payment_method_paypal">
										<input id="payment_method_paypal" type="radio" class="input-radio" name="payment_method" value="paypal" data-order_button_text="Proceed to PayPal">
										<label for="payment_method_paypal">PayPal</label>
										<div class="payment_box payment_method_paypal" style="display: none;">
											Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account
										</div>						
									</li>
								</ul>
							</div>

							<div class="text-center"><button type="submit" class="beta-btn primary" href="#">Checkout <i class="fa fa-chevron-right"></i></button></div>
						</div> <!-- .your-order -->
					</div>
				</div>
			</form>
		</div> <!-- #content -->
	</div> <!-- .container -->
    @endsection