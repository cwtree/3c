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
import com.cwtree.bean.Report;
import com.cwtree.service.ReportService;

@Controller
public class ReportManagerController {

	@Resource
	private ReportService reportService;

	@RequestMapping(value = "jiesuan", produces = { "application/json;charset=UTF-8" })
	public String jiesuan(HttpServletRequest request, ModelMap modelMap,
			Report report, BindingResult bindingResult) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		List<Report> res = this.reportService.queryDayReport(today);
		modelMap.put("res", res);
		double lirun = 0;
		for (int i = 0; i < res.size(); i++) {
			lirun += Double.parseDouble(res.get(i).getLiRun());
		}
		request.setAttribute("today", today);
		request.setAttribute("lirun", lirun);
		return "report/jiesuan";
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "dayjiesuan", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String dayjiesuan(HttpServletRequest request, ModelMap modelMap,
			Report report, BindingResult bindingResult) {
		String day = request.getParameter("day");
		List<Report> res = null;
		res = this.reportService.queryDayReport(day.trim());
		List name = new ArrayList();
		List kind = new ArrayList();
		List cb = new ArrayList();
		List number = new ArrayList();
		List price = new ArrayList();
		List lirun = new ArrayList();
		List date = new ArrayList();
		for(int i=0;i<res.size();i++) {
			Report r = res.get(i);
			name.add(r.getGoodsName());
			kind.add(r.getGoodsKind());
			cb.add(r.getGoodsCb());
			number.add(r.getDealNumber());
			price.add(r.getGoodsPrice());
			lirun.add(r.getLiRun());
			date.add(r.getDealDate());
		}
		Map m = new HashMap();
		m.put("name", name);
		m.put("kind", kind);
		m.put("cb", cb);
		m.put("number", number);
		m.put("price", price);
		m.put("lirun", lirun);
		m.put("date", date);
		m.put("jiesuanri", day);
		JSONObject json = new JSONObject();
		json.putAll(m);
		return json.toJSONString();
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "monthjiesuan", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String monthjiesuan(HttpServletRequest request, ModelMap modelMap,
			Report report, BindingResult bindingResult) {
		String month = request.getParameter("month");
		List<Report> res = null;
		res = this.reportService.queryMonthReport(month.trim());
		List name = new ArrayList();
		List kind = new ArrayList();
		List cb = new ArrayList();
		List number = new ArrayList();
		List price = new ArrayList();
		List lirun = new ArrayList();
		List date = new ArrayList();
		for(int i=0;i<res.size();i++) {
			Report r = res.get(i);
			name.add(r.getGoodsName());
			kind.add(r.getGoodsKind());
			cb.add(r.getGoodsCb());
			number.add(r.getDealNumber());
			price.add(r.getGoodsPrice());
			lirun.add(r.getLiRun());
			date.add(r.getDealDate());
		}
		Map m = new HashMap();
		m.put("name", name);
		m.put("kind", kind);
		m.put("cb", cb);
		m.put("number", number);
		m.put("price", price);
		m.put("lirun", lirun);
		m.put("date", date);
		m.put("jiesuanri", month);
		JSONObject json = new JSONObject();
		json.putAll(m);
		return json.toJSONString();
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "yearjiesuan", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String yearjiesuan(HttpServletRequest request, ModelMap modelMap,
			Report report, BindingResult bindingResult) {
		String year = request.getParameter("year");
		List<Report> res = null;
		res = this.reportService.queryYearReport(year.trim());
		List name = new ArrayList();
		List kind = new ArrayList();
		List cb = new ArrayList();
		List number = new ArrayList();
		List price = new ArrayList();
		List lirun = new ArrayList();
		List date = new ArrayList();
		for(int i=0;i<res.size();i++) {
			Report r = res.get(i);
			name.add(r.getGoodsName());
			kind.add(r.getGoodsKind());
			cb.add(r.getGoodsCb());
			number.add(r.getDealNumber());
			price.add(r.getGoodsPrice());
			lirun.add(r.getLiRun());
			date.add(r.getDealDate());
		}
		Map m = new HashMap();
		m.put("name", name);
		m.put("kind", kind);
		m.put("cb", cb);
		m.put("number", number);
		m.put("price", price);
		m.put("lirun", lirun);
		m.put("date", date);
		m.put("jiesuanri", year);
		JSONObject json = new JSONObject();
		json.putAll(m);
		return json.toJSONString();
	}

}
