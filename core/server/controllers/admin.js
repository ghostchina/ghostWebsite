var _             = require('lodash'),
    when          = require('when'),
    api           = require('../api'),
    errors        = require('../errors'),
    updateCheck   = require('../update-check'),
    adminControllers;

adminControllers = {
    // Route: index
    // Path: /ghost/
    // Method: GET
    'index': function (req, res) {
        /*jslint unparam:true*/

        function renderIndex() {
            res.render('default');
        }

        updateCheck().then(function () {
            return updateCheck.showUpdateNotification();
        }).then(function (updateVersion) {
            if (!updateVersion) {
                return when.resolve();
            }

            var notification = {
                type: 'success',
                location: 'top',
                dismissible: false,
                status: 'persistent',
                message: '<a href="https://ghost.org/download">Ghost ' + updateVersion +
                '</a> 已经可以使用! 太好了. 请点击 <a href="http://support.ghost.org/how-to-upgrade/">更新</a> '
            };

            return api.notifications.browse({context: {internal: true}}).then(function (results) {
                if (!_.some(results.notifications, { message: notification.message })) {
                    return api.notifications.add({ notifications: [notification] }, {context: {internal: true}});
                }
            });
        }).finally(function () {
            renderIndex();
        }).catch(errors.logError);
    }
};

module.exports = adminControllers;
