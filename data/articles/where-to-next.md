# Where To Next...

A website that helps you build a travel route by letting you know how you can get from country to country (and later within countries). The focus is on bus, train and ferry routes. Air travel and car travel isn't considered here as the range options available to both are endless.

# What's the URL look like

Urls to be formed like: /Turkey which lists each of the international connection points from the specified country. An url in the form /Turkey/Greece lists all the different ways one can get from Turkey to Greece directly.

# What's on a page

The top of each page would have some summary information. You can reach 8 other countries from Turkey via bus, ferry and train. A map could be shown (OSM?) that shows the focus country, it's neighbours and markers for each of the connecting/source locations. The map shouldn't have routes on the road but use straight lines between the nodes. The lines are coloured by route type: (blue-ferry, green-train, red-bus) and if possible, the route is annotated with the duration.

Other useful information might be:

- cost per day
- climate summary
- time information
- summary of govt. warnings for country
- links to buy guidebooks, phrase books, duolingo, wikivoyage, flickr images, fiction/non-fiction books.

A table of contents and then onto the useful information.

The Turkey page would be grouped by country in alphabetical order. So:

    Armenia
    Bulgaria
    Cyprus
    Greece
    Lebanon
    Iran
    Iraqi Kurdistan
    Syria

Then for each country the transport methods are listed. Greece by Train, Greece by Bus, Greece by Ferry. Within each section is a link to WikiVoyage, and Lonely Planey buy links. Maybe these could be enough to support the site. 

# JSON
{
	turkey: {
		links: [{name: 'Lonely Planet', url: ''}, {name: 'Wikivoyage', url: ''}],
		connections: [
			{ with: 'Greece', type: 'Bus', from: 'Istanbul', to: 'Thessalonika', duration: "12 hours"}
		],
		cities: [
			{
				name: "Istanbul"
				links: [{name: "wikivoyage", url: ""}]
			}
		]
	}
}

# Future Stuff
- UNESCO sites within the country
- intra-country nodes that cover only the cities worth seeing (parse wikivoyage as a node graph)
- Wikipedia Points of Interest nodes
- A travel planner that let's you build up your itinerary.