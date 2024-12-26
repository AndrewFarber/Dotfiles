{ name, email, ... }:

{
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
    extraConfig = {
      credential.helper = "store";
    };
  };
}
