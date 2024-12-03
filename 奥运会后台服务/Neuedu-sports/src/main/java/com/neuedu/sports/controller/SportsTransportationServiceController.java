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
import com.neuedu.sports.domain.SportsTransportationService;
import com.neuedu.sports.service.ISportsTransportationServiceService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 住宿与交通调度-交通服务Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/stayAndTraffic/transportationService")
@Tag(name = "【住宿与交通调度-交通服务】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsTransportationServiceController extends BaseController
{
    private final ISportsTransportationServiceService sportsTransportationServiceService;

    /**
     * 查询住宿与交通调度-交通服务列表
     */
    @Operation(summary = "查询住宿与交通调度-交通服务列表")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationService:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsTransportationService sportsTransportationService)
    {
        startPage();
        List<SportsTransportationService> list = sportsTransportationServiceService.selectSportsTransportationServiceList(sportsTransportationService);
        return getDataTable(list);
    }

    /**
     * 导出住宿与交通调度-交通服务列表
     */
    @Operation(summary = "导出住宿与交通调度-交通服务列表")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationService:export')")
    @Log(title = "住宿与交通调度-交通服务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsTransportationService sportsTransportationService)
    {
        List<SportsTransportationService> list = sportsTransportationServiceService.selectSportsTransportationServiceList(sportsTransportationService);
        ExcelUtil<SportsTransportationService> util = new ExcelUtil<SportsTransportationService>(SportsTransportationService.class);
        util.exportExcel(response, list, "住宿与交通调度-交通服务数据");
    }

    /**
     * 获取住宿与交通调度-交通服务详细信息
     */
    @Operation(summary = "获取住宿与交通调度-交通服务详细信息")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationService:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsTransportationServiceService.selectSportsTransportationServiceById(id));
    }

    /**
     * 新增住宿与交通调度-交通服务
     */
    @Operation(summary = "新增住宿与交通调度-交通服务")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationService:add')")
    @Log(title = "住宿与交通调度-交通服务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsTransportationService sportsTransportationService)
    {
        return toAjax(sportsTransportationServiceService.insertSportsTransportationService(sportsTransportationService));
    }

    /**
     * 修改住宿与交通调度-交通服务
     */
    @Operation(summary = "修改住宿与交通调度-交通服务")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationService:edit')")
    @Log(title = "住宿与交通调度-交通服务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsTransportationService sportsTransportationService)
    {
        return toAjax(sportsTransportationServiceService.updateSportsTransportationService(sportsTransportationService));
    }

    /**
     * 删除住宿与交通调度-交通服务
     */
    @Operation(summary = "删除住宿与交通调度-交通服务")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:transportationService:remove')")
    @Log(title = "住宿与交通调度-交通服务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsTransportationServiceService.deleteSportsTransportationServiceByIds(ids));
    }
}
