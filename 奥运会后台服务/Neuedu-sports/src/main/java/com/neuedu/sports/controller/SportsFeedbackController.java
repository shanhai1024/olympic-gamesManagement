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
import com.neuedu.sports.domain.SportsFeedback;
import com.neuedu.sports.service.ISportsFeedbackService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 用户反馈Controller
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@RestController
@RequestMapping("/message/feedback")
@Tag(name = "【用户反馈】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsFeedbackController extends BaseController
{
    private final ISportsFeedbackService sportsFeedbackService;

    /**
     * 查询用户反馈列表
     */
    @Operation(summary = "查询用户反馈列表")
    @PreAuthorize("@ss.hasPermi('message:feedback:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsFeedback sportsFeedback)
    {
        startPage();
        List<SportsFeedback> list = sportsFeedbackService.selectSportsFeedbackList(sportsFeedback);
        return getDataTable(list);
    }

    /**
     * 导出用户反馈列表
     */
    @Operation(summary = "导出用户反馈列表")
    @PreAuthorize("@ss.hasPermi('message:feedback:export')")
    @Log(title = "用户反馈", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsFeedback sportsFeedback)
    {
        List<SportsFeedback> list = sportsFeedbackService.selectSportsFeedbackList(sportsFeedback);
        ExcelUtil<SportsFeedback> util = new ExcelUtil<SportsFeedback>(SportsFeedback.class);
        util.exportExcel(response, list, "用户反馈数据");
    }

    /**
     * 获取用户反馈详细信息
     */
    @Operation(summary = "获取用户反馈详细信息")
    @PreAuthorize("@ss.hasPermi('message:feedback:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsFeedbackService.selectSportsFeedbackById(id));
    }

    /**
     * 新增用户反馈
     */
    @Operation(summary = "新增用户反馈")
    @PreAuthorize("@ss.hasPermi('message:feedback:add')")
    @Log(title = "用户反馈", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsFeedback sportsFeedback)
    {
        return toAjax(sportsFeedbackService.insertSportsFeedback(sportsFeedback));
    }

    /**
     * 修改用户反馈
     */
    @Operation(summary = "修改用户反馈")
    @PreAuthorize("@ss.hasPermi('message:feedback:edit')")
    @Log(title = "用户反馈", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsFeedback sportsFeedback)
    {
        return toAjax(sportsFeedbackService.updateSportsFeedback(sportsFeedback));
    }

    /**
     * 删除用户反馈
     */
    @Operation(summary = "删除用户反馈")
    @PreAuthorize("@ss.hasPermi('message:feedback:remove')")
    @Log(title = "用户反馈", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsFeedbackService.deleteSportsFeedbackByIds(ids));
    }
}
