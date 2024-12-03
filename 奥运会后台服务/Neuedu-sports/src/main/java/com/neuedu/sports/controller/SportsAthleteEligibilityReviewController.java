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
import com.neuedu.sports.domain.SportsAthleteEligibilityReview;
import com.neuedu.sports.service.ISportsAthleteEligibilityReviewService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 运动员管理-参赛资格审核Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/athletes/eligibilityReview")
@Tag(name = "【运动员管理-参赛资格审核】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAthleteEligibilityReviewController extends BaseController
{
    private final ISportsAthleteEligibilityReviewService sportsAthleteEligibilityReviewService;

    /**
     * 查询运动员管理-参赛资格审核列表
     */
    @Operation(summary = "查询运动员管理-参赛资格审核列表")
    @PreAuthorize("@ss.hasPermi('athletes:eligibilityReview:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsAthleteEligibilityReview sportsAthleteEligibilityReview)
    {
        startPage();
        List<SportsAthleteEligibilityReview> list = sportsAthleteEligibilityReviewService.selectSportsAthleteEligibilityReviewList(sportsAthleteEligibilityReview);
        return getDataTable(list);
    }

    /**
     * 导出运动员管理-参赛资格审核列表
     */
    @Operation(summary = "导出运动员管理-参赛资格审核列表")
    @PreAuthorize("@ss.hasPermi('athletes:eligibilityReview:export')")
    @Log(title = "运动员管理-参赛资格审核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsAthleteEligibilityReview sportsAthleteEligibilityReview)
    {
        List<SportsAthleteEligibilityReview> list = sportsAthleteEligibilityReviewService.selectSportsAthleteEligibilityReviewList(sportsAthleteEligibilityReview);
        ExcelUtil<SportsAthleteEligibilityReview> util = new ExcelUtil<SportsAthleteEligibilityReview>(SportsAthleteEligibilityReview.class);
        util.exportExcel(response, list, "运动员管理-参赛资格审核数据");
    }

    /**
     * 获取运动员管理-参赛资格审核详细信息
     */
    @Operation(summary = "获取运动员管理-参赛资格审核详细信息")
    @PreAuthorize("@ss.hasPermi('athletes:eligibilityReview:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsAthleteEligibilityReviewService.selectSportsAthleteEligibilityReviewById(id));
    }

    /**
     * 新增运动员管理-参赛资格审核
     */
    @Operation(summary = "新增运动员管理-参赛资格审核")
    @PreAuthorize("@ss.hasPermi('athletes:eligibilityReview:add')")
    @Log(title = "运动员管理-参赛资格审核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsAthleteEligibilityReview sportsAthleteEligibilityReview)
    {
        return toAjax(sportsAthleteEligibilityReviewService.insertSportsAthleteEligibilityReview(sportsAthleteEligibilityReview));
    }

    /**
     * 修改运动员管理-参赛资格审核
     */
    @Operation(summary = "修改运动员管理-参赛资格审核")
    @PreAuthorize("@ss.hasPermi('athletes:eligibilityReview:edit')")
    @Log(title = "运动员管理-参赛资格审核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsAthleteEligibilityReview sportsAthleteEligibilityReview)
    {
        return toAjax(sportsAthleteEligibilityReviewService.updateSportsAthleteEligibilityReview(sportsAthleteEligibilityReview));
    }

    /**
     * 删除运动员管理-参赛资格审核
     */
    @Operation(summary = "删除运动员管理-参赛资格审核")
    @PreAuthorize("@ss.hasPermi('athletes:eligibilityReview:remove')")
    @Log(title = "运动员管理-参赛资格审核", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsAthleteEligibilityReviewService.deleteSportsAthleteEligibilityReviewByIds(ids));
    }
}
