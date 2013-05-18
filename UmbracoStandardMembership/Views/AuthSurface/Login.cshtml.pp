﻿@using System.Web.Mvc
@using System.Web.Mvc.Html
@using Umbraco.Web
@using $rootnamespace$.Models
@using $rootnamespace$.Controllers.SurfaceControllers
@model AuthModel.LoginViewModel

@if (!ViewData.ModelState.IsValid)
{

    <h3>Forgotten your password?</h3>
    <p>
        Don't worry we all forget our passwords from time to time
    </p>
    
    foreach (ModelState modelState in ViewData.ModelState.Values)
    {
        var errors = modelState.Errors;

        if (errors.Any())
        { 
            <ul>
                @foreach(ModelError error in errors)
                {
                    <li><em>@error.ErrorMessage</em></li>
                }
            </ul>
        }
    }
    <p>
        <a href="/forgotten-password">Remind me</a>
    </p>
}


@using(Html.BeginUmbracoForm<AuthSurfaceController>("HandleLogin") )
{
    @Html.ValidationSummary(true)

    <fieldset>
        <legend>Login</legend>

        
		<div class="editor-label">
            @Html.LabelFor(model => model.EmailAddress)
        </div>

        <div class="editor-field">
            @Html.EditorFor(model => model.EmailAddress)
            @Html.ValidationMessageFor(model => model.EmailAddress)
        </div>
        
        <div class="editor-label">
            @Html.LabelFor(model => model.Password)
        </div>

        <div class="editor-field">
            @Html.EditorFor(model => model.Password)
            @Html.ValidationMessageFor(model => model.Password)
        </div>
        
        <p>
            <input type="submit" value="Login" />
        </p>
    </fieldset>
}