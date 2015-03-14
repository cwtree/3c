package com.cwtree.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.cwtree.bean.DealGoods;
import com.cwtree.bean.Goods;
import com.cwtree.bean.GoodsKind;
import com.cwtree.dao.GoodsDao;

@Service
public class GoodsDaoImpl implements GoodsDao {

	@Resource
	private SqlSession sqlSession;
	
	@Override
	public List<Goods> getAllGoods() {
		return this.sqlSession.selectList("getallgoods");
	}

	@Override
	public int insertGoods(Goods goods) {
		return this.sqlSession.insert("shanghuo", goods);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int minusGoods(Map m) {
		return this.sqlSession.update("outOne", m);
	}

	@Override
	public int addGoods(String goodsId) {
		return this.sqlSession.update("inOne",goodsId);
	}

	@Override
	public List<GoodsKind> getAllKinds() {
		return this.sqlSession.selectList("getallkinds");
	}

	@Override
	public int insertKind(GoodsKind gk) {
		return this.sqlSession.insert("addkinds", gk);
	}

	@Override
	public Goods getGoodsById(String id) {
		return this.sqlSession.selectOne("getgoodsbyid", id);
	}

	@Override
	public int saleOut(DealGoods dg) {
		return this.sqlSession.insert("saleout", dg);
	}

	@Override
	public int deleteGoods(String goodsId) {
		return this.sqlSession.delete("deletegoods", goodsId);
	}

	@Override
	public List<Goods> getGoodsByKind(String kind) {
		return this.sqlSession.selectList("getgoodsbykind", kind);
	}

	@Override
	public List<String> getNowKinds() {
		return this.sqlSession.selectList("nowkinds");
	}

	@Override
	public int getGoodsByKindsId(String kindsId) {
		return Integer.parseInt(this.sqlSession.selectList("getgoodsbykindsid", kindsId).get(0).toString());
	}

	@Override
	public int deleteKinds(String kindsId) {
		return this.sqlSession.delete("deletekinds", kindsId);
	}

	@Override
	public int updateGoods(Goods goods) {
		return this.sqlSession.update("updategoods", goods);
	}

	@Override
	public String calcSum() {
		return this.sqlSession.selectOne("calcSum");
	}

	@Override
	public String calcSumByKind(String goodsKind) {
		return this.sqlSession.selectOne("calcSumByKind", goodsKind);
	}

}
