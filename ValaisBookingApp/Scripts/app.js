var ViewModel = function () {
    var self = this;
    self.hotels = ko.observableArray();
    self.error = ko.observable();
    self.detail = ko.observable();

    

    var hotelsUri = '/api/hotels/';

    function ajaxHelper(uri, method, data) {
        self.error(''); // Clear error message
        return $.ajax({
            type: method,
            url: uri,
            dataType: 'json',
            contentType: 'application/json',
            data: data ? JSON.stringify(data) : null
        }).fail(function (jqXHR, textStatus, errorThrown) {
            self.error(errorThrown);
        });
    }

    self.getHotelDetail = function (item) {
        ajaxHelper(hotelsUri + item.IdHotel, 'GET').done(function (data) {
            self.detail(data);
        });
    }

    function getAllHotels() {
        ajaxHelper(hotelsUri, 'GET').done(function (data) {
            self.hotels(data);
        });
    }

    // Fetch the initial data.
    getAllHotels();
};

ko.applyBindings(new ViewModel());