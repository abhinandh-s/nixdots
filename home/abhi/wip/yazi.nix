{
config,
pkgs,
theme,
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
         { fg = "${theme.base07}"; mime = "image/*"; }
         { fg = "${theme.base07}"; mime = "video/*"; }
         { fg = "${theme.base07}"; mime = "audio/*"; }
         { fg = "${theme.base07}"; mime = "application/x-bzip"; }
       ];
     };
   };
 };
}
