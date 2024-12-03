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
import com.neuedu.sports.domain.SportsVolunteerApplicationApproval;
import com.neuedu.sports.service.ISportsVolunteerApplicationApprovalService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 志愿者管理-申请与审批Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/volunteer/applicationApproval")
@Tag(name = "【志愿者管理-申请与审批】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerApplicationApprovalController extends BaseController
{
    private final ISportsVolunteerApplicationApprovalService sportsVolunteerApplicationApprovalService;

    /**
     * 查询志愿者管理-申请与审批列表
     */
    @Operation(summary = "查询志愿者管理-申请与审批列表")
    @PreAuthorize("@ss.hasPermi('volunteer:applicationApproval:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval)
    {
        startPage();
        List<SportsVolunteerApplicationApproval> list = sportsVolunteerApplicationApprovalService.selectSportsVolunteerApplicationApprovalList(sportsVolunteerApplicationApproval);
        return getDataTable(list);
    }

    /**
     * 导出志愿者管理-申请与审批列表
     */
    @Operation(summary = "导出志愿者管理-申请与审批列表")
    @PreAuthorize("@ss.hasPermi('volunteer:applicationApproval:export')")
    @Log(title = "志愿者管理-申请与审批", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval)
    {
        List<SportsVolunteerApplicationApproval> list = sportsVolunteerApplicationApprovalService.selectSportsVolunteerApplicationApprovalList(sportsVolunteerApplicationApproval);
        ExcelUtil<SportsVolunteerApplicationApproval> util = new ExcelUtil<SportsVolunteerApplicationApproval>(SportsVolunteerApplicationApproval.class);
        util.exportExcel(response, list, "志愿者管理-申请与审批数据");
    }

    /**
     * 获取志愿者管理-申请与审批详细信息
     */
    @Operation(summary = "获取志愿者管理-申请与审批详细信息")
    @PreAuthorize("@ss.hasPermi('volunteer:applicationApproval:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsVolunteerApplicationApprovalService.selectSportsVolunteerApplicationApprovalById(id));
    }

    /**
     * 新增志愿者管理-申请与审批
     */
    @Operation(summary = "新增志愿者管理-申请与审批")
    @PreAuthorize("@ss.hasPermi('volunteer:applicationApproval:add')")
    @Log(title = "志愿者管理-申请与审批", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval)
    {
        return toAjax(sportsVolunteerApplicationApprovalService.insertSportsVolunteerApplicationApproval(sportsVolunteerApplicationApproval));
    }

    /**
     * 修改志愿者管理-申请与审批
     */
    @Operation(summary = "修改志愿者管理-申请与审批")
    @PreAuthorize("@ss.hasPermi('volunteer:applicationApproval:edit')")
    @Log(title = "志愿者管理-申请与审批", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval)
    {
        return toAjax(sportsVolunteerApplicationApprovalService.updateSportsVolunteerApplicationApproval(sportsVolunteerApplicationApproval));
    }

    /**
     * 删除志愿者管理-申请与审批
     */
    @Operation(summary = "删除志愿者管理-申请与审批")
    @PreAuthorize("@ss.hasPermi('volunteer:applicationApproval:remove')")
    @Log(title = "志愿者管理-申请与审批", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsVolunteerApplicationApprovalService.deleteSportsVolunteerApplicationApprovalByIds(ids));
    }
}
