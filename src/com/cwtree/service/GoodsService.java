package com.cwtree.service;

import java.util.List;

import com.cwtree.bean.DealGoods;
import com.cwtree.bean.Goods;
import com.cwtree.bean.GoodsKind;

public interface GoodsService {

	public List<Goods> queryAllGoods();
	
	public List<Goods> queryGoodsByKind(String kind);
	
	public List<String> queryNowKinds();
	
	public int shangHuo(Goods goods);
	
	public int saleOne(String goodsNumber,String goodsId);
	
	public int buyOne(String goodsId);
	
	public List<GoodsKind> queryAllKinds();
	
	public int updateGoods(Goods goods);
	
	public int addKinds(GoodsKind gk);
	
	public Goods findGoodsById(String id);
	
	public int saleOut(DealGoods dg);
	
	public int removeGoods(String goodsId);
	
	public int getGoodsCountByKindsId(String kindsId);
	
	public int removeKinds(String kindsId);
	
	public String getSum();
	
	public String getSumByKind(String goodsKind);
	
}
