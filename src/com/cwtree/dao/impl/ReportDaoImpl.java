package com.cwtree.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.cwtree.bean.Report;
import com.cwtree.dao.ReportDao;

@Service
public class ReportDaoImpl implements ReportDao {

	@Resource
	private SqlSession sqlSession;
	
	@Override
	public List<Report> getReportByDay(String day) {
		return this.sqlSession.selectList("reportbyday", day);
	}

	@Override
	public List<Report> getReportByMonth(String month) {
		return this.sqlSession.selectList("reportbymonth", month);
	}

	@Override
	public List<Report> getReportByYear(String year) {
		return this.sqlSession.selectList("reportbyyear", year);
	}

}
