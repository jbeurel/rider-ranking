require('cloud/app.js');

var ig = require('cloud/instagram-v1-1.0.js');
ig.initialize('ca2b7bf5c5b74211883ac9ae0f3d090e');

Parse.Cloud.beforeSave("Rider", function(request, response) {
    if(request.object.existed() == false) {
        console.log('Hook: beforeSave(' + request.object.get("username") + ')');
        ig.searchUser({
            q: request.object.get("username"),
            count: '1'
        }).then(function (searchResponse) {
            ig.getUser(searchResponse.data.data[0].id).then(function (riderResponse) {
                updateRiderFields(request.object, riderResponse.data.data);
                response.success();
            });
        });
    } else {
        response.success();
    }
});

Parse.Cloud.job("ridersUpdate", function (request, status) {
    Parse.Cloud.useMasterKey();
    var query = new Parse.Query("Rider");
    query.each(function (rider) {
        return ig.getUser(rider.get('instagramId')).then(function (riderResponse) {
            updateRiderFields(rider, riderResponse.data.data);
            rider.save();
        });
    }).then(function () {
        status.success("Riders Updated!")
    }, function (error) {
        status.error(error);
    });
});

function updateRiderFields(rider, data) {
    console.log('BEFORE ' + rider.get('followers') + ' AFTER ' + data.counts.followed_by);
    rider.set("username", data.username);
    rider.set("instagramId", data.id);
    rider.set("profilePicture", data.profile_picture);
    rider.set("name", data.full_name);
    rider.set("bio", data.bio.replace(/(\r\n|\n|\r)/gm," "));
    rider.set("website", data.website);
    rider.set("followers", data.counts.followed_by);
    rider.set("following", data.counts.follows);
    rider.set("data", data);
}
