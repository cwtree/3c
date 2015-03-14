package com.cwtree.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cwtree.bean.DealGoods;
import com.cwtree.bean.Goods;
import com.cwtree.bean.GoodsKind;
import com.cwtree.service.GoodsService;

@Controller
public class BizManagerController {

	@Resource
	private GoodsService goodsService;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value= "coreBiz",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String coreBiz(HttpServletRequest request,ModelMap modelMap,
			Goods goods, BindingResult bindingResult) throws Exception {
		List<Goods> allGoods = this.goodsService.queryAllGoods();
		List id = new ArrayList();
		List name = new ArrayList();
		List kind = new ArrayList();
		List cb = new ArrayList();
		List number = new ArrayList();
		for(int i=0;i<allGoods.size();i++) {
			Goods g = allGoods.get(i);
			if(Integer.valueOf(g.getGoodsNumber())<=0) {
				continue;
			} else {
				id.add(g.getGoodsId());
				name.add(g.getGoodsName());
				kind.add(g.getGoodsKind());
				cb.add(g.getGoodsCb());
				number.add(g.getGoodsNumber());
			}
		}
		Map m  = new HashMap();
		m.put("id", id);
		m.put("name", name);
		m.put("kind", kind);
		m.put("cb", cb);
		m.put("number", number);
		String sumcb = this.goodsService.getSum();
		m.put("sumcb", sumcb);
		JSONObject json = new JSONObject();
		json.putAll(m);
		return json.toJSONString();
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value= "nowkind",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String nowkind(HttpServletRequest request) {
		List<String> kinds = this.goodsService.queryNowKinds();
		Map m  = new HashMap();
		m.put("nowkinds", kinds);
		JSONObject json = new JSONObject();
		json.putAll(m);
		return json.toJSONString();
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value= "gengxinkucun",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String gengxinkucun(HttpServletRequest request) {
		String nowkind = request.getParameter("nowkind");
		List<Goods> goods = this.goodsService.queryGoodsByKind(nowkind);
		List id = new ArrayList();
		List name = new ArrayList();
		List kind = new ArrayList();
		List cb = new ArrayList();
		List number = new ArrayList();
		for(int i=0;i<goods.size();i++) {
			Goods g = goods.get(i);
			if(Integer.valueOf(g.getGoodsNumber())<=0) {
				continue;
			} else {
				id.add(g.getGoodsId());
				name.add(g.getGoodsName());
				kind.add(g.getGoodsKind());
				cb.add(g.getGoodsCb());
				number.add(g.getGoodsNumber());
			}
		}
		Map m  = new HashMap();
		m.put("id", id);
		m.put("name", name);
		m.put("kind", kind);
		m.put("cb", cb);
		m.put("number", number);
		String sumcbbykind = this.goodsService.getSumByKind(nowkind);
		m.put("sumcbbykind", sumcbbykind);
		JSONObject json = new JSONObject();
		json.putAll(m);
		return json.toJSONString();
	}
	
	@RequestMapping(value="delete",produces = {"application/json;charset=UTF-8"})
	public String delete(HttpServletRequest request,ModelMap modelMap,
			Goods goods, BindingResult bindingResult) {
		String goodsId = request.getParameter("goodsId");
		int res = this.goodsService.removeGoods(goodsId);
		if(res>0) {
			return "redirect";
		}else {
			bindingResult.reject("delete","删除商品出现异常错误！");
			return "redirect";
		}
	}
	
	@RequestMapping(value="shanghuo",produces = {"application/json;charset=UTF-8"})
	public String directShangHuo(HttpServletRequest request,ModelMap modelMap,
			Goods goods, BindingResult bindingResult) {
		List<GoodsKind> kinds = this.goodsService.queryAllKinds();
		modelMap.put("kinds", kinds);
		return "goods/shanghuo";
	}
	
	@RequestMapping(value="addKind",produces = {"application/json;charset=UTF-8"})
	public String addKind(HttpServletRequest request,ModelMap modelMap,
			GoodsKind gk, Goods goods,BindingResult bindingResult) {
		int res = this.goodsService.addKinds(gk);
		if(res>0) {
			return "redirect";
		}else {
			bindingResult.reject("kind","添加商品种类出现异常错误！");
			return "goods/shanghuo";
		}
	}
	
	@RequestMapping(value="beforeOutOne",produces = {"application/json;charset=UTF-8"})
	public String beforeOutOne(HttpServletRequest request,ModelMap modelMap,
			Goods goods, BindingResult bindingResult) {//售货之前输入信息
		String goodsId = request.getParameter("goodsId");
		Goods g = this.goodsService.findGoodsById(goodsId);
		modelMap.put("goods", g);
		return "goods/shouhuo";
	}
	
	@RequestMapping(value="beforeUpdate",produces = {"application/json;charset=UTF-8"})
	public String beforeUpdate(HttpServletRequest request,ModelMap modelMap,
			Goods goods, BindingResult bindingResult) {//售货之前输入信息
		String goodsId = request.getParameter("goodsId");
		Goods g = this.goodsService.findGoodsById(goodsId);
		modelMap.put("goods", g);
		return "goods/update";
	}
	
	@RequestMapping(value="updateGoods",produces = {"application/json;charset=UTF-8"})
	public String updateGoods(HttpServletRequest request,ModelMap modelMap,
			Goods goods, BindingResult bindingResult) {//售货之前输入信息
		int res = this.goodsService.updateGoods(goods);
		if(res>0) {
			return "redirect";
		}else {
			bindingResult.reject("updategoods","更新库存信息错误！");
			return "goods/update";
		}
	}
	
	
	@RequestMapping(value="shouHuo",produces = {"application/json;charset=UTF-8"})
	public String outOne(HttpServletRequest request,ModelMap modelMap,
			DealGoods dg, BindingResult bindingResult) {
		String goodsId = request.getParameter("goodsId");
		String dealNumber = request.getParameter("dealNumber");
		int res = this.goodsService.saleOne(dealNumber,goodsId);
		if(res>0) {
			dg.setDealDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			int r = this.goodsService.saleOut(dg);
			if(r>0) {
				return "redirect";
			}else {
				bindingResult.reject("saleout","售货单进单出现异常错误！");
				return "goods/shouhuo";
			}
		}else {
			bindingResult.reject("sale","库存单除单出现异常错误！");
			return "redirect";
		}
	}
	
	@RequestMapping(value="inOne",produces = {"application/json;charset=UTF-8"})
	public String inOne(HttpServletRequest request,ModelMap modelMap,
			Goods goods, BindingResult bindingResult) {
		String goodsId = request.getParameter("goodsId");
		int res = this.goodsService.buyOne(goodsId);
		if(res>0) {
			return "redirect";
		}else {
			bindingResult.reject("buy","上货一件出现异常错误！");
			return "redirect";
		}
	}
	
	@RequestMapping(value="shangHuo",produces = {"application/json;charset=UTF-8"})
	public String shangHuo(HttpServletRequest request,ModelMap modelMap,
			Goods goods, BindingResult bindingResult) {
		int res = this.goodsService.shangHuo(goods);
		if(res>0) {
			return "redirect";
		}else {
			bindingResult.reject("shanghuo","上货出现异常错误！");
			return "goods/shanghuo";
		}
	}
	
	@RequestMapping(value="nowkuncun",produces = {"application/json;charset=UTF-8"})
	public String nowkuncun(HttpServletRequest request) {
		return "main";
	}
	
	@RequestMapping(value="redirectkind",produces = {"application/json;charset=UTF-8"})
	public String redirectkind(HttpServletRequest request,ModelMap modelMap) {
		List<GoodsKind> gk = this.goodsService.queryAllKinds();
		modelMap.put("gk", gk);
		return "goods/kinds";
	}
	
	@RequestMapping(value="findgoodsbykind",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String findgoodsbykind(HttpServletRequest request,ModelMap modelMap) {
		String kindsId = request.getParameter("kindsId");
		int res = this.goodsService.getGoodsCountByKindsId(kindsId);
		if(res>0) {
			return "该类商品还有库存信息，不能删除！";
		}else {
			int r = this.goodsService.removeKinds(kindsId);
			if(r>0) {
				return "商品种类删除成功！";
			}else {
				return "商品种类删除失败！";
			}
		}
	}
	
	@RequestMapping(value="linfeikeji",produces = {"application/json;charset=UTF-8"})
	public String redirect(HttpServletRequest request) {
		return "main";
	}
	
}


















