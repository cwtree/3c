package com.cwtree.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cwtree.bean.DealGoods;
import com.cwtree.bean.Goods;
import com.cwtree.bean.GoodsKind;
import com.cwtree.dao.GoodsDao;
import com.cwtree.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Resource
	private GoodsDao goodsDao;
	
	@Override
	public List<Goods> queryAllGoods() {
		return this.goodsDao.getAllGoods();
	}

	@Override
	public int shangHuo(Goods goods) {
		return this.goodsDao.insertGoods(goods);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public int saleOne(String goodsNumber,String goodsId) {
		Map m = new HashMap();
		m.put("goodsNumber", goodsNumber);
		m.put("goodsid", goodsId);
		return this.goodsDao.minusGoods(m);
	}

	@Override
	public int buyOne(String goodsId) {
		return this.goodsDao.addGoods(goodsId);
	}

	@Override
	public List<GoodsKind> queryAllKinds() {
		return this.goodsDao.getAllKinds();
	}

	@Override
	public int addKinds(GoodsKind gk) {
		return this.goodsDao.insertKind(gk);
	}

	@Override
	public Goods findGoodsById(String id) {
		return this.goodsDao.getGoodsById(id);
	}

	@Override
	public int saleOut(DealGoods dg) {
		return this.goodsDao.saleOut(dg);
	}

	@Override
	public int removeGoods(String goodsId) {
		return this.goodsDao.deleteGoods(goodsId);
	}

	@Override
	public List<Goods> queryGoodsByKind(String kind) {
		return this.goodsDao.getGoodsByKind(kind);
	}

	@Override
	public List<String> queryNowKinds() {
		return this.goodsDao.getNowKinds();
	}

	@Override
	public int getGoodsCountByKindsId(String kindsId) {
		return this.goodsDao.getGoodsByKindsId(kindsId);
	}

	@Override
	public int removeKinds(String kindsId) {
		return this.goodsDao.deleteKinds(kindsId);
	}

	@Override
	public int updateGoods(Goods goods) {
		return this.goodsDao.updateGoods(goods);
	}

	@Override
	public String getSum() {
		return this.goodsDao.calcSum();
	}

	@Override
	public String getSumByKind(String goodsKind) {
		return this.goodsDao.calcSumByKind(goodsKind);
	}

}
