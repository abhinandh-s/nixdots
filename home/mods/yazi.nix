{
config,
pkgs,
colorpencil,
...
}:
{
 programs.yazi = {
   enable =true;
   settings = {
     log = {
       enabled = false;
     };
     manager = {
       show_hidden = true;
       sort_by = "modified";
       sort_dir_first = true;
       sort_reverse = true;
     };
   };
   theme = {
     filetype = {
       rules = [
         { fg = "${colorpencil.cat_sky}"; mime = "image/*"; }
         { fg = "${colorpencil.cat_green}"; mime = "video/*"; }
         { fg = "${colorpencil.cat_mauve}"; mime = "audio/*"; }
         { fg = "${colorpencil.cat_blue}"; mime = "application/x-bzip"; }
       ];
     };
   };
 };
}
