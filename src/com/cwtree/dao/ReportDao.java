package com.cwtree.dao;

import java.util.List;

import com.cwtree.bean.Report;


public interface ReportDao {

	public List<Report> getReportByDay(String day);
	
	public List<Report> getReportByMonth(String month);
	
	public List<Report> getReportByYear(String year);
	
}
