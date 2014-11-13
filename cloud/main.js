var ig = require('cloud/instagram-v1-1.0.js');
ig.initialize('ca2b7bf5c5b74211883ac9ae0f3d090e');

Parse.Cloud.beforeSave("Rider", function(request, response) {
    ig.searchUser({
        q: request.object.get("username"),
        count: '1'
    }).then(function (searchResponse) {
        ig.getUser(searchResponse.data.data[0].id).then(function (riderResponse) {
            var riderData = riderResponse.data.data;
            request.object.set("username", riderData.username);
            request.object.set("instagramId", riderData.id);
            request.object.set("profilePicture", riderData.profile_picture);
            request.object.set("name", riderData.full_name);
            request.object.set("bio", riderData.bio);
            request.object.set("website", riderData.website);
            request.object.set("followers", riderData.counts.followed_by);
            request.object.set("following", riderData.counts.follows);
            request.object.set("data", riderData);
            response.success();
        });
    });
});
