![Alvis](alvis_logo.svg)
# Alvis OnDemand Dashboard Projinfo
Alvis OnDemand dashboard app for displaying project statistics in [Alvis OnDemand](https://portal.c3se.chalmers.se).

## Prerequisites
This Ruby on Rails application is developed for Alvis OnDemand and relies on
(albeit few) local data containing information about project and usage.  The app
requires `python3` to run an in-house developed tool (`projinfo`) for gathering
project statistics.

## Install
```
$ git clone https://github.com/c3se/ood_dashboard_projinfo.git
```
The dasboard app needs to do slight modification to the dashboard app and new
files must be added to
`ondemand/apps/dashboard/app/{models,views,controllers}/`.

Update `/var/www/ood/apps/sys/dashboard/config/routes.rb`:
```
  if Configuration.can_access_files?
  [...]
+   get "projinfo", to: "projinfo#index"
  [...]
  end
```

Place the files inside `models`, `views` and `controllers` into the respective
`/var/www/ood/apps/sys/dashboard/app/{models,views,controllers}`.

### Adding to navigation
WIP.

## Customizations
You can customize the app by changing the ERB-files inside `views`.

## Debugging
User logs is found at `<ood_logs>/ondemand-nginx/<user>`, usually
`/var/log/ondemand-nginx/<user>`.
