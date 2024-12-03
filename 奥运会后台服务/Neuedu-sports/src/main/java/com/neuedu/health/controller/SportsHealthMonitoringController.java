package com.neuedu.health.controller;

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
import com.neuedu.health.domain.SportsHealthMonitoring;
import com.neuedu.health.service.ISportsHealthMonitoringService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 健康监测Controller
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@RestController
@RequestMapping("/health/monitoring")
@Tag(name = "【健康监测】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsHealthMonitoringController extends BaseController
{
    private final ISportsHealthMonitoringService sportsHealthMonitoringService;

    /**
     * 查询健康监测列表
     */
    @Operation(summary = "查询健康监测列表")
    @PreAuthorize("@ss.hasPermi('health:monitoring:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsHealthMonitoring sportsHealthMonitoring)
    {
        startPage();
        List<SportsHealthMonitoring> list = sportsHealthMonitoringService.selectSportsHealthMonitoringList(sportsHealthMonitoring);
        return getDataTable(list);
    }

    /**
     * 导出健康监测列表
     */
    @Operation(summary = "导出健康监测列表")
    @PreAuthorize("@ss.hasPermi('health:monitoring:export')")
    @Log(title = "健康监测", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsHealthMonitoring sportsHealthMonitoring)
    {
        List<SportsHealthMonitoring> list = sportsHealthMonitoringService.selectSportsHealthMonitoringList(sportsHealthMonitoring);
        ExcelUtil<SportsHealthMonitoring> util = new ExcelUtil<SportsHealthMonitoring>(SportsHealthMonitoring.class);
        util.exportExcel(response, list, "健康监测数据");
    }

    /**
     * 获取健康监测详细信息
     */
    @Operation(summary = "获取健康监测详细信息")
    @PreAuthorize("@ss.hasPermi('health:monitoring:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsHealthMonitoringService.selectSportsHealthMonitoringById(id));
    }

    /**
     * 新增健康监测
     */
    @Operation(summary = "新增健康监测")
    @PreAuthorize("@ss.hasPermi('health:monitoring:add')")
    @Log(title = "健康监测", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsHealthMonitoring sportsHealthMonitoring)
    {
        return toAjax(sportsHealthMonitoringService.insertSportsHealthMonitoring(sportsHealthMonitoring));
    }

    /**
     * 修改健康监测
     */
    @Operation(summary = "修改健康监测")
    @PreAuthorize("@ss.hasPermi('health:monitoring:edit')")
    @Log(title = "健康监测", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsHealthMonitoring sportsHealthMonitoring)
    {
        return toAjax(sportsHealthMonitoringService.updateSportsHealthMonitoring(sportsHealthMonitoring));
    }

    /**
     * 删除健康监测
     */
    @Operation(summary = "删除健康监测")
    @PreAuthorize("@ss.hasPermi('health:monitoring:remove')")
    @Log(title = "健康监测", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsHealthMonitoringService.deleteSportsHealthMonitoringByIds(ids));
    }
}
