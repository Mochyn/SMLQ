signature STUDY_PROGRAMME =
sig
	type study_programme
	val bswu	: study_programme
	val kdd		: study_programme
	val ebuss	: study_programme
	val ects	: study_programme -> int
	val title	: study_programme -> string
end

structure StudyProgramme :> STUDY_PROGRAMME = 
struct
	type study_programme = {
		title	: string,
		ects	: int
	}

	val bswu = {
		title	= "Bachelor in Software Development",
		ects	= 180
	}

	val kdd = {
		title	= "MSc in Digital Design",
		ects	= 180
	}

	val ebuss = {
		title	= "MSc in E-Business",
		ects	= 120
	}

	fun ects (sp:study_programme) = (#ects sp)

	fun title (edu:study_programme) = (#title edu)
end

signature COURSE =
sig
	type study_programme = StudyProgramme.study_programme
	type course
	val all_courses	: course list
	val name	: course -> string
	val part_of	: course -> study_programme
end

structure Course: COURSE =
struct
	type study_programme = StudyProgramme.study_programme

	type course = {
		name	: string,
		part_of	: study_programme
	}

	val all_courses = [
	{part_of = StudyProgramme.bswu, name = "Introduction to Programming"},
	{part_of = StudyProgramme.kdd, name = "Introduction to Digital Design"},
	{part_of = StudyProgramme.ebuss, name = "Introduction to E-business" },
	{part_of = StudyProgramme.ebuss, name = "Advanced IT Strategy" }	
	]

	fun name(c:course) = (#name c)

	fun part_of(c:course) = (#part_of c)
end

val msc = filter(fn c => StudyProgramme.ects (#part_of c) = 120) Course.all_courses;
