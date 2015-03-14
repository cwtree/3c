package com.cwtree.service;

import java.util.List;

import com.cwtree.bean.Report;

public interface ReportService {

	public List<Report> queryDayReport(String day);
	
	public List<Report> queryMonthReport(String month);
	
	public List<Report> queryYearReport(String year);
	
}
