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
import com.neuedu.sports.domain.SportsEventSchedule;
import com.neuedu.sports.service.ISportsEventScheduleService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 赛事管理-赛程规划Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/competition/eventSchedule")
@Tag(name = "【赛事管理-赛程规划】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsEventScheduleController extends BaseController
{
    private final ISportsEventScheduleService sportsEventScheduleService;

    /**
     * 查询赛事管理-赛程规划列表
     */
    @Operation(summary = "查询赛事管理-赛程规划列表")
    @PreAuthorize("@ss.hasPermi('competition:eventSchedule:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsEventSchedule sportsEventSchedule)
    {
        startPage();
        List<SportsEventSchedule> list = sportsEventScheduleService.selectSportsEventScheduleList(sportsEventSchedule);
        return getDataTable(list);
    }

    /**
     * 导出赛事管理-赛程规划列表
     */
    @Operation(summary = "导出赛事管理-赛程规划列表")
    @PreAuthorize("@ss.hasPermi('competition:eventSchedule:export')")
    @Log(title = "赛事管理-赛程规划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsEventSchedule sportsEventSchedule)
    {
        List<SportsEventSchedule> list = sportsEventScheduleService.selectSportsEventScheduleList(sportsEventSchedule);
        ExcelUtil<SportsEventSchedule> util = new ExcelUtil<SportsEventSchedule>(SportsEventSchedule.class);
        util.exportExcel(response, list, "赛事管理-赛程规划数据");
    }

    /**
     * 获取赛事管理-赛程规划详细信息
     */
    @Operation(summary = "获取赛事管理-赛程规划详细信息")
    @PreAuthorize("@ss.hasPermi('competition:eventSchedule:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsEventScheduleService.selectSportsEventScheduleById(id));
    }

    /**
     * 新增赛事管理-赛程规划
     */
    @Operation(summary = "新增赛事管理-赛程规划")
    @PreAuthorize("@ss.hasPermi('competition:eventSchedule:add')")
    @Log(title = "赛事管理-赛程规划", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsEventSchedule sportsEventSchedule)
    {
        return toAjax(sportsEventScheduleService.insertSportsEventSchedule(sportsEventSchedule));
    }

    /**
     * 修改赛事管理-赛程规划
     */
    @Operation(summary = "修改赛事管理-赛程规划")
    @PreAuthorize("@ss.hasPermi('competition:eventSchedule:edit')")
    @Log(title = "赛事管理-赛程规划", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsEventSchedule sportsEventSchedule)
    {
        return toAjax(sportsEventScheduleService.updateSportsEventSchedule(sportsEventSchedule));
    }

    /**
     * 删除赛事管理-赛程规划
     */
    @Operation(summary = "删除赛事管理-赛程规划")
    @PreAuthorize("@ss.hasPermi('competition:eventSchedule:remove')")
    @Log(title = "赛事管理-赛程规划", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsEventScheduleService.deleteSportsEventScheduleByIds(ids));
    }
}
