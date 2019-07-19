require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "購物車基本功能" do
    it "可以把商品丟進購物車裡，購物車就會有東西了" do
    end

    it "如果加了相同種類的商品到購物車裡，購買項目(CartItem)並不會增加，但商品數量會改變" do
    end

    it "商品可以放進購物車裡，也可以再拿出來" do
    end

    it "每個CartItem都可以計算它自己的金額(小計)" do
    end

    it "可以計算整台購物車的總消費金額" do
    end

    it "特別活動可搭配折扣(ex聖誕節時全面九折，或是滿額滿千送百)" do
    end
  end

  describe "進階功能" do
    it "可將購物車內容轉換成Hash，存到Session裡" do
    end

    it "可以把Session的內容(Hash格式)，還原成購物車的內容" do
    end
  end
end
