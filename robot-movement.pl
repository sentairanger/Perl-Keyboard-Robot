# import libraries
use RPi::PIGPIO ':all';
use Term::ReadKey;
use Switch;
use RPi::PIGPIO::Device::LED;

# define Pi
my $pi = RPi::PIGPIO->connect('192.168.0.10');

# Define the pins
$pi->set_mode(7, PI_OUTPUT);
$pi->set_mode(8, PI_OUTPUT);
$pi->set_mode(9, PI_OUTPUT);
$pi->set_mode(10, PI_OUTPUT);
my $eye = RPi::PIGPIO::Device::LED->new($pi,25);

# Subroutines for directions
sub forward {
	$pi->write(7, LOW);
    $pi->write(8, HI);
    $pi->write(9, HI);
    $pi->write(10, LOW);

}

sub backward {
	$pi->write(7, HI);
    $pi->write(8, LOW);
    $pi->write(9, LOW);
    $pi->write(10, HI);
}

sub left {
	$pi->write(7, HI);
    $pi->write(8, LOW);
    $pi->write(9, HI);
    $pi->write(10, LOW);
}

sub right {
	$pi->write(7, LOW);
    $pi->write(8, HI);
    $pi->write(9, LOW);
    $pi->write(10, HI);
}

sub stop {
	$pi->write(7, LOW);
    $pi->write(8, LOW);
    $pi->write(9, LOW);
    $pi->write(10, LOW);
}

# Blink the eye of the robot four times
for ($x = 0; $x < 4; $x++) {
  $eye->on;
  sleep(1);
  $eye->off;
  sleep(1);
}

# robot movement
ReadMode('cbreak');
print "Robot keyboard movement\n";
print "Press keys to move the robot\n";

while (1) {
    $char = ReadKey(0);
    print "$char\n";
    last unless defined $char;
    switch($char) {
      case("w")   { forward(); }
      case("a")   { left(); }
      case("s")   { backward(); }
      case("d")   { right(); }
      case("f")   { stop(); }
    }
    
}

ReadMode('normal');
