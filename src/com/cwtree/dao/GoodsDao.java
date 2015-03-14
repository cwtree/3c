package com.cwtree.dao;


import java.util.List;
import java.util.Map;

import com.cwtree.bean.DealGoods;
import com.cwtree.bean.Goods;
import com.cwtree.bean.GoodsKind;

public interface GoodsDao {

	public List<Goods> getAllGoods();
	
	public List<Goods> getGoodsByKind(String kind);
	
	public List<String> getNowKinds();
	
	public int insertGoods(Goods goods);
	
	public int updateGoods(Goods goods);
	
	@SuppressWarnings("rawtypes")
	public int minusGoods(Map m);
	
	public int addGoods(String goodsId);
	
	public List<GoodsKind> getAllKinds();
	
	public int insertKind(GoodsKind gk);
	
	public Goods getGoodsById(String id);
	
	public int saleOut(DealGoods dg);
	
	public int deleteGoods(String goodsId);
	
	public int getGoodsByKindsId(String kindsId);
	
	public int deleteKinds(String kindsId);
	
	public String calcSum();
	
	public String calcSumByKind(String goodsKind);
	
}
