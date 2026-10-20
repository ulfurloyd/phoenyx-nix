{ ... }: {
  flake.homeModules.k9s = { ... }: {
    programs.k9s = {
      enable = true;
      settings = {
        k9s = {
          liveViewAutoRefresh = false;
          gpuVendors = { };
          screenDumpDir = "/home/wolf/.local/state/k9s/screen-dumps";
          refreshRate = 2;
          apiServerTimeout = "2m0s";
          maxConnRetry = 5;
          readOnly = false;
          noExitOnCtrlC = false;
          portForwardAddress = "localhost";
          ui = {
            enableMouse = false;
            headless = false;
            logoless = false;
            crumbsless = false;
            splashless = false;
            reactive = false;
            noIcons = false;
            invert = false;
            defaultsToFullScreen = false;
            useFullGVRTitle = false;
            skin = "terminal";
          };
          skipLatestRevCheck = false;
          disablePodCounting = false;
          shellPod = {
            image = "busybox:1.37.0";
            namespace = "default";
            limits = {
              cpu = "100m";
              memory = "100Mi";
            };
          };
          imageScans = {
            enable = false;
            exclusions = {
              namespaces = [ ];
              labels = { };
            };
          };
          logger = {
            tail = 100;
            buffer = 5000;
            sinceSeconds = -1;
            textWrap = false;
            disableAutoscroll = false;
            columnLock = false;
            showTime = false;
          };
          thresholds = {
            cpu = {
              critical = 90;
              warn = 70;
            };
            memory = {
              critical = 90;
              warn = 70;
            };
          };
          defaultView = "";
        };
      };
      aliases = {
        dp = "deployments";
        sec = "v1/secrets";
        jo = "jobs";
        cr = "clusterroles";
        crb = "clusterrolebindings";
        ro = "roles";
        rb = "rolebindings";
        np = "networkpolicies";
      };
      skins = {
        terminal = {
          k9s = {
            body.bgColor = "default";
            prompt.bgColor = "default";
            info.sectionColor = "default";
            dialog = {
              bgColor = "default";
              labelFgColor = "default";
              fieldFgColor = "default";
            };
            frame = {
              crumbs.bgColor = "default";
              title = {
                bgColor = "default";
                counterColor = "default";
              };
              menu.fgColor = "default";
            };
            views = {
              charts.bgColor = "default";
              table = {
                bgColor = "default";
                header = {
                  fgColor = "default";
                  bgColor = "default";
                };
              };
              xray.bgColor = "default";
              logs = {
                bgColor = "default";
                indicator = {
                  bgColor = "default";
                  toggleOnColor = "default";
                  toggleOffColor = "default";
                };
              };
              yaml = {
                colonColor = "default";
                valueColor = "default";
              };
            };
          };
        };
      };
    };
  };
}
