package com.neuedu.sports.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.neuedu.common.annotation.Log;
import com.neuedu.common.core.controller.BaseController;
import com.neuedu.common.core.domain.AjaxResult;
import com.neuedu.common.enums.BusinessType;
import com.neuedu.sports.domain.SportsAthletePerformanceTracking;
import com.neuedu.sports.service.ISportsAthletePerformanceTrackingService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 运动员管理-现追踪Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/athletes/performanceTracking")
@Tag(name = "【运动员管理-现追踪】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAthletePerformanceTrackingController extends BaseController
{
    private final ISportsAthletePerformanceTrackingService sportsAthletePerformanceTrackingService;

    /**
     * 查询运动员管理-现追踪列表
     */
    @Operation(summary = "查询运动员管理-现追踪列表")
    @PreAuthorize("@ss.hasPermi('athletes:performanceTracking:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsAthletePerformanceTracking sportsAthletePerformanceTracking)
    {
        startPage();
        List<SportsAthletePerformanceTracking> list = sportsAthletePerformanceTrackingService.selectSportsAthletePerformanceTrackingList(sportsAthletePerformanceTracking);
        return getDataTable(list);
    }

    /**
     * 导出运动员管理-现追踪列表
     */
    @Operation(summary = "导出运动员管理-现追踪列表")
    @PreAuthorize("@ss.hasPermi('athletes:performanceTracking:export')")
    @Log(title = "运动员管理-现追踪", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsAthletePerformanceTracking sportsAthletePerformanceTracking)
    {
        List<SportsAthletePerformanceTracking> list = sportsAthletePerformanceTrackingService.selectSportsAthletePerformanceTrackingList(sportsAthletePerformanceTracking);
        ExcelUtil<SportsAthletePerformanceTracking> util = new ExcelUtil<SportsAthletePerformanceTracking>(SportsAthletePerformanceTracking.class);
        util.exportExcel(response, list, "运动员管理-现追踪数据");
    }

    /**
     * 获取运动员管理-现追踪详细信息
     */
    @Operation(summary = "获取运动员管理-现追踪详细信息")
    @PreAuthorize("@ss.hasPermi('athletes:performanceTracking:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsAthletePerformanceTrackingService.selectSportsAthletePerformanceTrackingById(id));
    }

    /**
     * 新增运动员管理-现追踪
     */
    @Operation(summary = "新增运动员管理-现追踪")
    @PreAuthorize("@ss.hasPermi('athletes:performanceTracking:add')")
    @Log(title = "运动员管理-现追踪", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsAthletePerformanceTracking sportsAthletePerformanceTracking)
    {
        return toAjax(sportsAthletePerformanceTrackingService.insertSportsAthletePerformanceTracking(sportsAthletePerformanceTracking));
    }

    /**
     * 修改运动员管理-现追踪
     */
    @Operation(summary = "修改运动员管理-现追踪")
    @PreAuthorize("@ss.hasPermi('athletes:performanceTracking:edit')")
    @Log(title = "运动员管理-现追踪", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsAthletePerformanceTracking sportsAthletePerformanceTracking)
    {
        return toAjax(sportsAthletePerformanceTrackingService.updateSportsAthletePerformanceTracking(sportsAthletePerformanceTracking));
    }

    /**
     * 删除运动员管理-现追踪
     */
    @Operation(summary = "删除运动员管理-现追踪")
    @PreAuthorize("@ss.hasPermi('athletes:performanceTracking:remove')")
    @Log(title = "运动员管理-现追踪", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsAthletePerformanceTrackingService.deleteSportsAthletePerformanceTrackingByIds(ids));
    }
}
