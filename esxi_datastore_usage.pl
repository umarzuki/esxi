#!/usr/bin/perl

use strict;
use warnings;
use VMware::VIRuntime;

# Connect to the server
my $server = Vim::find_entity_view(view_type => 'HostSystem');

# Get a list of all datastores
my $datastores = Vim::get_views(mo_ref_array => $server->datastore);

# Iterate through the datastores and print their usage
foreach my $datastore (@$datastores) {
  my $summary = $datastore->summary;
  my $capacity = $summary->capacity;
  my $freeSpace = $summary->freeSpace;
  my $usedSpace = $capacity - $freeSpace;
  my $usage = sprintf("%.2f", $usedSpace / $capacity * 100);

  print "Datastore: " . $summary->name . "\n";
  print "  Capacity: " . $capacity . " bytes\n";
  print "  Used: " . $usedSpace . " bytes (" . $usage . "%)\n";
  print "  Free: " . $freeSpace . " bytes\n";
  print "\n";
}
