# ddrmenutemplates

This project is a repository for example templates for DotNetNuke's DDRMenu navigation provider. These templates can be used as is, or as a basis for the development of custom templates.

There are three basic example templates to get you started:

- ULToken - Plain unordered list using token template parser 
- ULRazor - Plain unordered list using Razor template parser 
- ULXSLT - Plain unordered list using XSLT template parser

Also included are example templates for:

- Superfish 
- Treeview 
- HTML dropdown 
- Breadcrumb trail 
- Sitemap 
- Mega menu (contributed by Armand Datema of [2DNN](2dnn.com))

### Using these examples

These templates are intended to demonstrate how you might implement common navigation elements, and to act as a starting point for your own templates. While they will work as they stand by simply copying the folders into your skin, if you use them in production environments then you are encouraged to merge any included CSS into your skin and adjust the styles according to your requirements. It is also recommended to merge and minify any Javascript files for maximum efficiency. (Also don't forget to change or remove references in menudef.xml once you've finished!)
