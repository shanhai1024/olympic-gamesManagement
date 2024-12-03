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
import com.neuedu.sports.domain.SportsTransportationScheduling;
import com.neuedu.sports.service.ISportsTransportationSchedulingService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 住宿与交通调度-交通调度Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/stayAndTraffic/transportationScheduling")
@Tag(name = "【住宿与交通调度-交通调度】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsTransportationSchedulingController extends BaseController
{
    private final ISportsTransportationSchedulingService sportsTransportationSchedulingService;

    /**
     * 查询住宿与交通调度-交通调度列表
     */
    @Operation(summary = "查询住宿与交通调度-交通调度列表")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationScheduling:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsTransportationScheduling sportsTransportationScheduling)
    {
        startPage();
        List<SportsTransportationScheduling> list = sportsTransportationSchedulingService.selectSportsTransportationSchedulingList(sportsTransportationScheduling);
        return getDataTable(list);
    }

    /**
     * 导出住宿与交通调度-交通调度列表
     */
    @Operation(summary = "导出住宿与交通调度-交通调度列表")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationScheduling:export')")
    @Log(title = "住宿与交通调度-交通调度", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsTransportationScheduling sportsTransportationScheduling)
    {
        List<SportsTransportationScheduling> list = sportsTransportationSchedulingService.selectSportsTransportationSchedulingList(sportsTransportationScheduling);
        ExcelUtil<SportsTransportationScheduling> util = new ExcelUtil<SportsTransportationScheduling>(SportsTransportationScheduling.class);
        util.exportExcel(response, list, "住宿与交通调度-交通调度数据");
    }

    /**
     * 获取住宿与交通调度-交通调度详细信息
     */
    @Operation(summary = "获取住宿与交通调度-交通调度详细信息")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationScheduling:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsTransportationSchedulingService.selectSportsTransportationSchedulingById(id));
    }

    /**
     * 新增住宿与交通调度-交通调度
     */
    @Operation(summary = "新增住宿与交通调度-交通调度")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationScheduling:add')")
    @Log(title = "住宿与交通调度-交通调度", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsTransportationScheduling sportsTransportationScheduling)
    {
        return toAjax(sportsTransportationSchedulingService.insertSportsTransportationScheduling(sportsTransportationScheduling));
    }

    /**
     * 修改住宿与交通调度-交通调度
     */
    @Operation(summary = "修改住宿与交通调度-交通调度")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationScheduling:edit')")
    @Log(title = "住宿与交通调度-交通调度", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsTransportationScheduling sportsTransportationScheduling)
    {
        return toAjax(sportsTransportationSchedulingService.updateSportsTransportationScheduling(sportsTransportationScheduling));
    }

    /**
     * 删除住宿与交通调度-交通调度
     */
    @Operation(summary = "删除住宿与交通调度-交通调度")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationScheduling:remove')")
    @Log(title = "住宿与交通调度-交通调度", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsTransportationSchedulingService.deleteSportsTransportationSchedulingByIds(ids));
    }
}
