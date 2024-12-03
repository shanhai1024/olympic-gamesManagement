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
import com.neuedu.sports.domain.SportsAudienceNavigation;
import com.neuedu.sports.service.ISportsAudienceNavigationService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 住宿与交通调度-观众导航Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/stayAndTraffic/audienceNavigation")
@Tag(name = "【住宿与交通调度-观众导航】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAudienceNavigationController extends BaseController
{
    private final ISportsAudienceNavigationService sportsAudienceNavigationService;

    /**
     * 查询住宿与交通调度-观众导航列表
     */
    @Operation(summary = "查询住宿与交通调度-观众导航列表")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:audienceNavigation:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsAudienceNavigation sportsAudienceNavigation)
    {
        startPage();
        List<SportsAudienceNavigation> list = sportsAudienceNavigationService.selectSportsAudienceNavigationList(sportsAudienceNavigation);
        return getDataTable(list);
    }

    /**
     * 导出住宿与交通调度-观众导航列表
     */
    @Operation(summary = "导出住宿与交通调度-观众导航列表")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:audienceNavigation:export')")
    @Log(title = "住宿与交通调度-观众导航", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsAudienceNavigation sportsAudienceNavigation)
    {
        List<SportsAudienceNavigation> list = sportsAudienceNavigationService.selectSportsAudienceNavigationList(sportsAudienceNavigation);
        ExcelUtil<SportsAudienceNavigation> util = new ExcelUtil<SportsAudienceNavigation>(SportsAudienceNavigation.class);
        util.exportExcel(response, list, "住宿与交通调度-观众导航数据");
    }

    /**
     * 获取住宿与交通调度-观众导航详细信息
     */
    @Operation(summary = "获取住宿与交通调度-观众导航详细信息")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:audienceNavigation:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsAudienceNavigationService.selectSportsAudienceNavigationById(id));
    }

    /**
     * 新增住宿与交通调度-观众导航
     */
    @Operation(summary = "新增住宿与交通调度-观众导航")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:audienceNavigation:add')")
    @Log(title = "住宿与交通调度-观众导航", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsAudienceNavigation sportsAudienceNavigation)
    {
        return toAjax(sportsAudienceNavigationService.insertSportsAudienceNavigation(sportsAudienceNavigation));
    }

    /**
     * 修改住宿与交通调度-观众导航
     */
    @Operation(summary = "修改住宿与交通调度-观众导航")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:audienceNavigation:edit')")
    @Log(title = "住宿与交通调度-观众导航", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsAudienceNavigation sportsAudienceNavigation)
    {
        return toAjax(sportsAudienceNavigationService.updateSportsAudienceNavigation(sportsAudienceNavigation));
    }

    /**
     * 删除住宿与交通调度-观众导航
     */
    @Operation(summary = "删除住宿与交通调度-观众导航")
    @PreAuthorize("@ss.hasPermi('stayAndTraffic:audienceNavigation:remove')")
    @Log(title = "住宿与交通调度-观众导航", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsAudienceNavigationService.deleteSportsAudienceNavigationByIds(ids));
    }
}
