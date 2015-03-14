package com.cwtree.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cwtree.bean.Report;
import com.cwtree.dao.ReportDao;
import com.cwtree.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService {

	
	@Resource
	private ReportDao reportDao;
	
	@Override
	public List<Report> queryDayReport(String day) {
		return this.reportDao.getReportByDay(day);
	}

	@Override
	public List<Report> queryMonthReport(String month) {
		return this.reportDao.getReportByMonth(month);
	}

	@Override
	public List<Report> queryYearReport(String year) {
		return this.reportDao.getReportByYear(year);
	}

}
