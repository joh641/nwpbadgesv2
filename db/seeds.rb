#encoding: utf-8

badges = [
  { 
    name: 'Member',
    description: "This badge is awarded to Educator Innovators who’ve subscribed to the Educator Innovator blog.",
    claimcode: true
  },
  { 
    name: 'Explorer',
    description: "This badge is awarded to Educator Innovators who’ve participated in an Educator Innovator learning opportunity offered at the Educator Innovator site or at partner sites.",
    claimcode: true
  },
  { 
    name: 'Promoter',
    description: "This badge is awarded to Educator Innovators who’ve shown they know how to spread the word about the Educator Innovator Network, its partners and collaborators and its Connected Learning-related opportunities."
  },
  { 
    name: 'Networker',
    description: "This badge is awarded to Educator Innovators who’ve collaborated with others in the network."
  },
  {
    name: 'Facilitator', 
    description: "This badge is awarded to Educator Innovators who’ve facilitated a learning experience that evidences Connected Learning principles in action or in theory, either at the Educator Innovator site, at partner sites or face to face."
  },
  { 
    name: 'Maker',
    description: "This badge is awarded to Educator Innovators who’ve produced Connected Learning-based resources, events, curriculum or created artifacts as part of a making event organized by the Educator Innovator site or by partners and collaborators."
  },
  { 
    name: 'Advocate',
    description: "This badge is awarded to Educator Innovators who’ve advocated for production-centered, peer-supported, interest driven learning opportunities in their educational context, in their community and/or in online spaces."
  },
  { 
    name: 'Designer',
    description: "This badge is awarded to Educator Innovators who’ve implemented a learning opportunity for the young people they work with that is designed with Connected Learning principles in mind."
  },
  { 
    name: 'Educator Innovator',
    description: 'Educator Innovatore'
  }
]

badges.each do |badge|
  Badge.create badge
end