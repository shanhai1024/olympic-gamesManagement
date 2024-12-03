package com.neuedu.sports.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
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
import com.neuedu.sports.domain.SportsAccommodationScheduling;
import com.neuedu.sports.service.ISportsAccommodationSchedulingService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

import javax.servlet.http.HttpServletResponse;

/**
 * 住宿与交通调度-住宿调度Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/stayAndTraffic/accommodationScheduling")
@Tag(name = "【住宿与交通调度-住宿调度】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAccommodationSchedulingController extends BaseController
{
    private final ISportsAccommodationSchedulingService sportsAccommodationSchedulingService;

    /**
     * 查询住宿与交通调度-住宿调度列表
     */
    @Operation(summary = "查询住宿与交通调度-住宿调度列表")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:accommodationScheduling:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsAccommodationScheduling sportsAccommodationScheduling)
    {
        startPage();
        List<SportsAccommodationScheduling> list = sportsAccommodationSchedulingService.selectSportsAccommodationSchedulingList(sportsAccommodationScheduling);
        return getDataTable(list);
    }

    /**
     * 导出住宿与交通调度-住宿调度列表
     */
    @Operation(summary = "导出住宿与交通调度-住宿调度列表")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:accommodationScheduling:export')")
    @Log(title = "住宿与交通调度-住宿调度", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsAccommodationScheduling sportsAccommodationScheduling)
    {
        List<SportsAccommodationScheduling> list = sportsAccommodationSchedulingService.selectSportsAccommodationSchedulingList(sportsAccommodationScheduling);
        ExcelUtil<SportsAccommodationScheduling> util = new ExcelUtil<SportsAccommodationScheduling>(SportsAccommodationScheduling.class);
        util.exportExcel(response, list, "住宿与交通调度-住宿调度数据");
    }

    /**
     * 获取住宿与交通调度-住宿调度详细信息
     */
    @Operation(summary = "获取住宿与交通调度-住宿调度详细信息")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:accommodationScheduling:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsAccommodationSchedulingService.selectSportsAccommodationSchedulingById(id));
    }

    /**
     * 新增住宿与交通调度-住宿调度
     */
    @Operation(summary = "新增住宿与交通调度-住宿调度")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:accommodationScheduling:add')")
    @Log(title = "住宿与交通调度-住宿调度", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsAccommodationScheduling sportsAccommodationScheduling)
    {
        return toAjax(sportsAccommodationSchedulingService.insertSportsAccommodationScheduling(sportsAccommodationScheduling));
    }

    /**
     * 修改住宿与交通调度-住宿调度
     */
    @Operation(summary = "修改住宿与交通调度-住宿调度")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:accommodationScheduling:edit')")
    @Log(title = "住宿与交通调度-住宿调度", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsAccommodationScheduling sportsAccommodationScheduling)
    {
        return toAjax(sportsAccommodationSchedulingService.updateSportsAccommodationScheduling(sportsAccommodationScheduling));
    }

    /**
     * 删除住宿与交通调度-住宿调度
     */
    @Operation(summary = "删除住宿与交通调度-住宿调度")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:accommodationScheduling:remove')")
    @Log(title = "住宿与交通调度-住宿调度", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsAccommodationSchedulingService.deleteSportsAccommodationSchedulingByIds(ids));
    }
}
