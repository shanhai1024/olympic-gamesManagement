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
import com.neuedu.sports.domain.SportsVolunteerActivityAssignment;
import com.neuedu.sports.service.ISportsVolunteerActivityAssignmentService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 志愿者管理-活动分配Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/volunteer/activityAssignment")
@Tag(name = "【志愿者管理-活动分配】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerActivityAssignmentController extends BaseController
{
    private final ISportsVolunteerActivityAssignmentService sportsVolunteerActivityAssignmentService;

    /**
     * 查询志愿者管理-活动分配列表
     */
    @Operation(summary = "查询志愿者管理-活动分配列表")
    @PreAuthorize("@ss.hasPermi('volunteer:activityAssignment:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment)
    {
        startPage();
        List<SportsVolunteerActivityAssignment> list = sportsVolunteerActivityAssignmentService.selectSportsVolunteerActivityAssignmentList(sportsVolunteerActivityAssignment);
        return getDataTable(list);
    }

    /**
     * 导出志愿者管理-活动分配列表
     */
    @Operation(summary = "导出志愿者管理-活动分配列表")
    @PreAuthorize("@ss.hasPermi('volunteer:activityAssignment:export')")
    @Log(title = "志愿者管理-活动分配", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment)
    {
        List<SportsVolunteerActivityAssignment> list = sportsVolunteerActivityAssignmentService.selectSportsVolunteerActivityAssignmentList(sportsVolunteerActivityAssignment);
        ExcelUtil<SportsVolunteerActivityAssignment> util = new ExcelUtil<SportsVolunteerActivityAssignment>(SportsVolunteerActivityAssignment.class);
        util.exportExcel(response, list, "志愿者管理-活动分配数据");
    }

    /**
     * 获取志愿者管理-活动分配详细信息
     */
    @Operation(summary = "获取志愿者管理-活动分配详细信息")
    @PreAuthorize("@ss.hasPermi('volunteer:activityAssignment:query')")
    @GetMapping(value = "/{zho}")
    public AjaxResult getInfo(@PathVariable("zho") Long zho)
    {
        return success(sportsVolunteerActivityAssignmentService.selectSportsVolunteerActivityAssignmentByZho(zho));
    }

    /**
     * 新增志愿者管理-活动分配
     */
    @Operation(summary = "新增志愿者管理-活动分配")
    @PreAuthorize("@ss.hasPermi('volunteer:activityAssignment:add')")
    @Log(title = "志愿者管理-活动分配", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment)
    {
        return toAjax(sportsVolunteerActivityAssignmentService.insertSportsVolunteerActivityAssignment(sportsVolunteerActivityAssignment));
    }

    /**
     * 修改志愿者管理-活动分配
     */
    @Operation(summary = "修改志愿者管理-活动分配")
    @PreAuthorize("@ss.hasPermi('volunteer:activityAssignment:edit')")
    @Log(title = "志愿者管理-活动分配", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment)
    {
        return toAjax(sportsVolunteerActivityAssignmentService.updateSportsVolunteerActivityAssignment(sportsVolunteerActivityAssignment));
    }

    /**
     * 删除志愿者管理-活动分配
     */
    @Operation(summary = "删除志愿者管理-活动分配")
    @PreAuthorize("@ss.hasPermi('volunteer:activityAssignment:remove')")
    @Log(title = "志愿者管理-活动分配", businessType = BusinessType.DELETE)
	@DeleteMapping("/{zhos}")
    public AjaxResult remove(@PathVariable( name = "zhos" ) Long[] zhos) 
    {
        return toAjax(sportsVolunteerActivityAssignmentService.deleteSportsVolunteerActivityAssignmentByZhos(zhos));
    }
}
