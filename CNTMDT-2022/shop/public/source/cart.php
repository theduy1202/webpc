<?php
    namespace App;

    class Cart
    {
        public $items = null;
        public $totalQty=0;
        public $totalPrice=0;

        public function __construct($oldCart){
            if($oldCart){
                $this->items =$ldCart->items;
                $this->totalQty=$oldCart->totalQty;
                $this->totalPrice=$oldCart->totalPrice;
            }
        }
        public function add($item, $id){
            $gioHang =['qty'=>0,'price'=>$item->unit_price,'item'=>$item];
            if($this->items){
                if(array_key_exists($id, $this->items)){
                    $gioHang=$this->items[$id];
                }
            }
            $gioHang['qty']++;
            $gioHang['price']=$item->unit_price * $gioHang['qty'];
            $this->items[$id]=$gioHang;
            $this->totalQty++;
            $this->totalPrice+=$item->unit_price;
        }
        //xóa 1 sản phẩm
        public function reduceByOne($id){
            $this->items[$id]['qty']--;
            $this->items[$id]['price']-= $this->items[$id]['item']['price'];
            $this->totalQty--;
            $this->totalPrice-=$this->items[$id]['item']['price'];
            if($this->items[$id]['qty']<=0){
                unset($this->items[$id]);
            }
        }
        //xóa nhiều sản phẩm
        public function removeItem($id){
            $this->totalQty-=$this->items[$id]['qty'];
            $this->totalPrice-=$this->items[$id]['price'];
            unset($this->items[$id]);
        }

    }

?>